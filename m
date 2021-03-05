Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC8B32E2F8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 08:34:03 +0100 (CET)
Received: from localhost ([::1]:38834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI4yI-0005sz-Rr
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 02:34:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lI4vs-0005Bw-56
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 02:31:32 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40980
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lI4vp-0002d4-Ez
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 02:31:31 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lI4ve-0002Be-C5; Fri, 05 Mar 2021 07:31:24 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210304221103.6369-1-mark.cave-ayland@ilande.co.uk>
 <af17d866-e7ad-7f58-e1df-8af1a72c904d@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <51a008a7-8ed5-26c3-aba0-beaecc1dac1d@ilande.co.uk>
Date: Fri, 5 Mar 2021 07:31:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <af17d866-e7ad-7f58-e1df-8af1a72c904d@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 00/42] esp: consolidate PDMA transfer buffers and other
 fixes
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/03/2021 22:58, Philippe Mathieu-Daudé wrote:

> On 3/4/21 11:10 PM, Mark Cave-Ayland wrote:
>> This patch series comes from an experimental branch that I've been working on
>> to try and boot a MacOS toolbox ROM under the QEMU q800 machine. The effort is
> ...
>> v3:
>> - Rebase onto master (fix up minor conflicts with Paolo's SCSI error handling changes)
>> - Add R-B tags from Philippe and Laurent
>> - Check for failure of qdev_realize() in patch 3
>> - Touch up the commit messages on patches 9 and 10
>> - Remove extra "& 0xff" in patch 9
>> - Add deferred command completion interrupt for PDMA in patch 33
>> - Remove ti_size assignment comment in patch 38
>> - Remove extra "& 0xff" in patch 39
> 
> Thanks, series LGTM!
> 
> Phil.

Thanks Phil (and Laurent) for the review. Gitlab-CI is happy at 
https://gitlab.com/mcayland/qemu/-/pipelines/265668799 so if there are no further 
comments I'll send a qemu-sparc PR for this over the next couple of days.


ATB,

Mark.

