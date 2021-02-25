Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21D132569A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 20:25:27 +0100 (CET)
Received: from localhost ([::1]:37914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFMGM-0005Re-5P
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 14:25:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lFM8k-00029m-JB
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 14:17:34 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37808
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lFM8g-0000Uy-MF
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 14:17:34 -0500
Received: from host31-48-197-98.range31-48.btcentralplus.com ([31.48.197.98]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lFM8X-0002Qe-4c; Thu, 25 Feb 2021 19:17:21 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <e1eaa8e1-c3e8-478b-615d-3cf87542d357@amsat.org>
 <f0ba939b-b69f-5fce-e24a-5778aa29b59f@ilande.co.uk>
 <e5f47ad6-7eb9-8875-7a7b-8144190a18cd@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <ebc08154-6213-14a7-a2c2-24692b68536e@ilande.co.uk>
Date: Thu, 25 Feb 2021 19:17:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e5f47ad6-7eb9-8875-7a7b-8144190a18cd@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 31.48.197.98
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 00/42] esp: consolidate PDMA transfer buffers and other
 fixes
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.435,
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

On 25/02/2021 10:50, Philippe Mathieu-Daudé wrote:

>> Thanks Phil - I understand that a set of 42 patches for a 25 year old
>> disk controller is never going to be the top of most people's review
>> list, and some parts are almost impossible to review unless you have a
>> good understanding of the datasheet.
> 
> Well I also have a series for a 30+ years old MIPS board and am
> not confident to post it because probably little interest for
> the community, although it is very interesting to compare with
> actual SoC and see how the IP blocks are indeed reused and improved
> over the time -- or not... i.e. when someone report a hw bug in a 2020
> product and the same bug is present in the IP core from the 80th it
> inherited ;)
> 
>> I'll see if Laurent has any comments over the next few days, but other
>> than that I'd be inclined to send a v3 followed soon by a PR to avoid me
>> having to update these regularly (I already see a slight conflict with
>> Paolo's SCSI error handling changes, for example).
> 
> I'll have a look at your v3 and Cc you when I post this MIPS board :D

Well I can do a cursory review of the patches, but I can't really say I've got much 
in the way of MIPS experience to be able to review in depth. If you feel that you 
would like some R-B tags before sending a PR then I can certainly give it another set 
of eyeballs.


ATB,

Mark.

