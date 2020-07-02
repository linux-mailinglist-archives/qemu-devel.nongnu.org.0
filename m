Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D25211D8F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 09:55:33 +0200 (CEST)
Received: from localhost ([::1]:55474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqu4C-0001LA-Ok
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 03:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1jqu33-0000NI-7Y
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 03:54:21 -0400
Received: from mail.ispras.ru ([83.149.199.84]:39562)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1jqu31-00036L-3g
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 03:54:20 -0400
Received: from [192.168.0.183] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 1498A4089A54;
 Thu,  2 Jul 2020 07:54:15 +0000 (UTC)
Subject: Re: Race with atexit functions in system emulation
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>
References: <87v9j7qyuh.fsf@linaro.org>
 <CAMgSi0G+_3ZVDMpYL5XYWvUyUUtP__zUCLPpRJ+adn3t7B8a7g@mail.gmail.com>
 <87blkyqrtl.fsf@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <68921920-00f6-816d-6091-a3af328bfce2@ispras.ru>
Date: Thu, 2 Jul 2020 10:54:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <87blkyqrtl.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 01:54:41
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.07.2020 10:49, Alex Bennée wrote:
> 
> Pavel Dovgalyuk <pavel.dovgaluk@gmail.com> writes:
> 
>> Is it true, that semihosting can be used to access (read and write) host
>> files from the guest?
> 
> They can - but in these test cases we are only using semihosting for
> console output and signalling an exit code at the end of the test. I
> don't think that gets in the way of record/replay (aside from the exit
> race described).

Ok.

>> In such a case it can't be used with RR for the following reasons:
>> 1. We don't preserve modified files, therefore the execution result may
>> change in the future runs.
>> 2. Even in the case, when all the files are read only, semihosting FDs
>> can't be saved, therefore it may not be used with reverse debugging.
> 
> This raises a wider question of what is the best way to indicate support
> (or lack of support) for a particular device to a user? Do we need a
> "replay aware" list or annotation?

There is a replay blocker, which is set at the command-line parsing phase.
E.g., user gets an error when tries to enable -smp >1.


Pavel Dovgalyuk

