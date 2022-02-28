Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D06744C7060
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 16:14:23 +0100 (CET)
Received: from localhost ([::1]:49914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOhjC-0002FW-Mf
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 10:14:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schaub@mit.edu>)
 id 1nOhi6-0000lc-K3; Mon, 28 Feb 2022 10:13:14 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:37860
 helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schaub@mit.edu>)
 id 1nOhi5-0001OQ-2I; Mon, 28 Feb 2022 10:13:14 -0500
Received: from [10.31.51.144] (dhcp-10-31-51-144.dyn.mit.edu [10.31.51.144])
 (authenticated bits=0) (User authenticated as schaub@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 21SFD8Cq030737
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 28 Feb 2022 10:13:09 -0500
Message-ID: <949b0675-cbae-51dc-5a3b-d0215738279b@mit.edu>
Date: Mon, 28 Feb 2022 10:13:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] explicitly link libqemuutil against rt
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <eddf5c19-5582-7d88-5232-2052f87583ae@mit.edu>
 <CAFEAcA-dStng7OmArapZTMXx=fF9cme3VftLAAd-nQgcv0ZgGA@mail.gmail.com>
 <YhzeYQ7akrGqAIW7@redhat.com>
From: Simeon Schaub <schaub@mit.edu>
In-Reply-To: <YhzeYQ7akrGqAIW7@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=18.9.28.11; envelope-from=schaub@mit.edu;
 helo=outgoing.mit.edu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We generally target glibc 2.12 in the Julia ecosystem, since CentOS 6 is
still quite common in the HPC community.

Best,
Simeon

On 2/28/22 09:38, Daniel P. Berrangé wrote:
> On Mon, Feb 28, 2022 at 02:15:11PM +0000, Peter Maydell wrote:
>> On Mon, 28 Feb 2022 at 14:12, Simeon Schaub <schaub@mit.edu> wrote:
>>>
>>> >From e77de12cc33846a3de71d1858e497fbf4cdbff96 Mon Sep 17 00:00:00 2001
>>> From: Simeon David Schaub <schaub@mit.edu>
>>> Date: Sun, 27 Feb 2022 22:59:19 -0500
>>> Subject: [PATCH] explicitly link libqemuutil against rt
>>>
>>> Qemu uses `clock_gettime` which is already part of more recent versions
>>> of glibc, but on older versions it is still required to link against
>>> librt.
>>
>> Which version of glibc are you seeing this with ?
> 
> The man page says
> 
>    "Link with -lrt (only for glibc versions before 2.17)."
> 
> and even ancient RHEL-7 had glibc 2.17, so I can't imagine any platform
> we currently target in QEMU has a glibc older than 2.17, so QEMU should
> not need this change, unless there's some other scenario not described
> in the commit message.
> 
> Regards,
> Daniel

