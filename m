Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F443AA4F1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:08:11 +0200 (CEST)
Received: from localhost ([::1]:39054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltbpZ-00054z-Jz
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ltbo2-0003eY-5J; Wed, 16 Jun 2021 16:06:34 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:59053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ltbnz-0000xd-Hq; Wed, 16 Jun 2021 16:06:33 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7E15974570B;
 Wed, 16 Jun 2021 22:06:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 51B957456E3; Wed, 16 Jun 2021 22:06:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4CB727456B4;
 Wed, 16 Jun 2021 22:06:27 +0200 (CEST)
Date: Wed, 16 Jun 2021 22:06:27 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 10/13] hw/misc/auxbus: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
In-Reply-To: <cad0abfc-da54-1ac5-74e6-882251c70465@amsat.org>
Message-ID: <edfa6c2-b157-53cd-c083-8cd01e489e8@eik.bme.hu>
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-11-f4bug@amsat.org>
 <0a45d89a-b710-12f7-6f82-75fdc6f0384d@linaro.org>
 <cad0abfc-da54-1ac5-74e6-882251c70465@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1997640944-1623873987=:48693"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1997640944-1623873987=:48693
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 16 Jun 2021, Philippe Mathieu-Daudé wrote:
> On 6/16/21 8:46 PM, Richard Henderson wrote:
>> On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
>>> @@ -161,12 +157,11 @@ AUXReply aux_request(AUXBus *bus, AUXCommand
>>> cmd, uint32_t address,
>>>           }
>>>             ret = AUX_I2C_ACK;
>>> -        while (len > 0) {
>>> -            if (i2c_send_recv(i2c_bus, data++, true) < 0) {
>>> +        for (i = 0; i < len; i++) {
>>> +            if (i2c_send(i2c_bus, data[i]) < 0) {
>>>                   ret = AUX_I2C_NACK;
>>>                   break;
>>>               }
>>> -            len--;
>>>           }
>>
>> This form of updating ret is better than...
>>
>>> @@ -200,14 +195,13 @@ AUXReply aux_request(AUXBus *bus, AUXCommand
>>> cmd, uint32_t address,
>>>             bus->last_transaction = cmd;
>>>           bus->last_i2c_address = address;
>>> -        while (len > 0) {
>>> -            if (i2c_send_recv(i2c_bus, data++, true) < 0) {
>>> +        for (i = 0; i < len; i++) {
>>> +            if (i2c_send(i2c_bus, data[i]) < 0) {
>>>                   i2c_end_transfer(i2c_bus);
>>>                   break;
>>>               }
>>> -            len--;
>>>           }
>>> -        if (len == 0) {
>>> +        if (i == len) {
>>>               ret = AUX_I2C_ACK;
>>>           }
>>
>> ... this one.
>
> I totally agree :) I was a bit ashamed for posting that, I thought
> Zoltan would prefer less changes so used this form.
> Will update on respin.

It's not the number of changes that matters but if there's any change in 
behaviour. If you can make it clearer that there's no change in behaviour 
by making more changes then that's OK.

Regards,
BALATON Zoltan

>> Otherwise,
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Thanks!
>
>
--3866299591-1997640944-1623873987=:48693--

