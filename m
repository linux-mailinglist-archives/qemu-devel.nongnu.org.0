Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FA63AA285
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 19:36:10 +0200 (CEST)
Received: from localhost ([::1]:39458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltZST-0002zv-FK
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 13:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1ltZRF-0001mX-AY
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 13:34:53 -0400
Received: from pv34p98im-ztdg02172101.me.com ([17.143.234.142]:44558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1ltZRD-0008U9-Le
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 13:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1623864890; bh=4tffC8ViyuKYEOWeB2hxo7TOQLd2DBk83NjsElGiK84=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=SsC+W266UIXJuWYLA2pvyBESKnqU3Gmz7bHFgZKF1Da2UgmoQ4KarzOJtEs3TW3Kt
 0qs+62OjcJbroe5/J30YALCLrxDAAa2DaFBHOlVO86plnCtF4svREI7ZKY1o9A1PEh
 dycdbTZwul16N71oU9uhRxCo8XM1rnQuaQK9F/11Uza/XyzTsQ1TLHXg9s5vZ7QHNA
 GeYoJQGysNWMhB1XnRHeMFH1ZoFKDtgBE3+hRBZofujSSqFO86kdbQpZJHsSH02o69
 sE73TMJUYSX7kJEmmHTucvV6YtDOc2b0VIA/gO1VZZGRNX6MQu4LZb3QwjqR5dL2fh
 75pYocNDk010Q==
Received: from smtpclient.apple (unknown [17.11.167.120])
 by pv34p98im-ztdg02172101.me.com (Postfix) with ESMTPSA id 12E4054000B;
 Wed, 16 Jun 2021 17:34:48 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [PATCH 1/4] mc146818rtc: Make PF independent of PIE
From: Jason Thorpe <thorpej@me.com>
In-Reply-To: <5c2ae675-f734-174d-6640-baebc817f3ba@linaro.org>
Date: Wed, 16 Jun 2021 10:34:47 -0700
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <39CACE5E-7CCD-400C-A983-689474D42EC5@me.com>
References: <20210613211549.18094-1-thorpej@me.com>
 <20210613211549.18094-2-thorpej@me.com>
 <5c2ae675-f734-174d-6640-baebc817f3ba@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-16_11:2021-06-15,
 2021-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=980 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2106160101
Received-SPF: pass client-ip=17.143.234.142; envelope-from=thorpej@me.com;
 helo=pv34p98im-ztdg02172101.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


> On Jun 14, 2021, at 9:17 PM, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> Cc: paolo and mst
>=20
> On 6/13/21 2:15 PM, Jason Thorpe wrote:
>> Make the PF flag behave like real hardware by always running the
>> periodic timer without regard to the setting of the PIE bit, so
>> that the PF will be set when the period expires even if an interrupt
>> will not be raised.  This behavior is documented on page 16 of the
>> MC146818A advance information datasheet.
>> Signed-off-by: Jason Thorpe <thorpej@me.com>
>> ---
>>  hw/rtc/mc146818rtc.c | 4 ----
>>  1 file changed, 4 deletions(-)
>> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
>> index 4fbafddb22..366b8f13de 100644
>> --- a/hw/rtc/mc146818rtc.c
>> +++ b/hw/rtc/mc146818rtc.c
>> @@ -155,10 +155,6 @@ static uint32_t =
rtc_periodic_clock_ticks(RTCState *s)
>>  {
>>      int period_code;
>>  -    if (!(s->cmos_data[RTC_REG_B] & REG_B_PIE)) {
>> -        return 0;
>> -     }
>=20
> This looks correct, but I don't know enough about this device.

Quoting the data sheet here, for context:

<quote>
PF - The periodic interrupt flag (PF) is a read-only bit which is set to =
a "1" when a particular edge is detected on the selected tap of the =
divider chain.  The RS3 to RS0 bits establish the periodic rate.  PF is =
set to "1" independent of the state of the PIE bit.  PF initiates an =
~IRQ signal and sets the IRQF bit when PIE is also a "1".  The PF bit is =
cleared by a ~RESET or a software read of Register C.
</quote>

This is why my patch always runs the timer, and does not suppress it if =
PF is already set; real hardware will always latch PF at regular =
intervals irrespective of when software reads Register C.

-- thorpej


