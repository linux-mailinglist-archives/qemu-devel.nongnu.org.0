Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C4C2D0E06
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 11:31:46 +0100 (CET)
Received: from localhost ([::1]:47240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmDo1-00048l-Pu
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 05:31:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kmDik-0000hw-Hd; Mon, 07 Dec 2020 05:26:18 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:24282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kmDic-00043e-K6; Mon, 07 Dec 2020 05:26:16 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0E65974645F;
 Mon,  7 Dec 2020 11:26:06 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CD11F74645B; Mon,  7 Dec 2020 11:26:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CBA9C746383;
 Mon,  7 Dec 2020 11:26:05 +0100 (CET)
Date: Mon, 7 Dec 2020 11:26:05 +0100 (CET)
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v10] spapr: Implement Open Firmware client interface
In-Reply-To: <c5cf97dd-d1aa-389a-2bff-5781a6af803e@ozlabs.ru>
Message-ID: <7d3dadd5-af95-a270-d576-bbd327a97ece@eik.bme.hu>
References: <20201013021911.28701-1-aik@ozlabs.ru>
 <20201204193205.45d2a15a@bahia.lan>
 <c5cf97dd-d1aa-389a-2bff-5781a6af803e@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 10%
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
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Mon, 7 Dec 2020, Alexey Kardashevskiy wrote:
> On 05/12/2020 05:32, Greg Kurz wrote:
>> On Tue, 13 Oct 2020 13:19:11 +1100
>> Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>> 
>>> +static void readstr(hwaddr pa, char *buf, int size)
>>> +{
>>> +    cpu_physical_memory_read(pa, buf, size);
>>> +    if (buf[size - 1] != '\0') {
>>> +        buf[size - 1] = '\0';
>>> +        if (strlen(buf) == size - 1) {
>>> +            trace_spapr_of_client_error_str_truncated(buf, size);
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +static bool cmpservice(const char *s, size_t len,
>>> +                       unsigned nargs, unsigned nret,
>>> +                       const char *s1, size_t len1,
>>> +                       unsigned nargscheck, unsigned nretcheck)
>>> +{
>>> +    if (strcmp(s, s1)) {
>>> +        return false;
>>> +    }
>>> +    if ((nargscheck && (nargs != nargscheck)) ||
>>> +        (nretcheck && (nret != nretcheck))) {
>> 
>> Parenthesitis : != has precedence over &&.
>
>
> I love my braces :)

Then keep them for yourself and not leave them around in code :-) I prefer 
minimum parenthesis too as that's easier to read and you can always look 
up operator precedence if in doubt so I'd vote for dropping them unless 
really needed or the compiler complains about it.

>> 
>>> +static uint32_t of_client_setprop(SpaprMachineState *spapr,
>>> +                                  uint32_t nodeph, uint32_t pname,
>>> +                                  uint32_t valaddr, uint32_t vallen)
>>> +{
>>> +    char propname[OF_PROPNAME_LEN_MAX + 1];
>>> +    uint32_t ret = -1;
>>> +    int offset;
>>> +    char trval[64] = "";
>>> +
>>> +    readstr(pname, propname, sizeof(propname));
>>> +    /*
>>> +     * We only allow changing properties which we know how to update on
>>> +     * the QEMU side.
>>> +     */
>>> +    if (vallen == sizeof(uint32_t)) {
>>> +        uint32_t val32 = ldl_be_phys(first_cpu->as, valaddr);
>>> +
>>> +        if ((strcmp(propname, "linux,rtas-base") == 0) ||
>>> +            (strcmp(propname, "linux,rtas-entry") == 0)) {
>> 
>> What about :
>>
>>          if (!strcmp(propname, "linux,rtas-base") ||
>>              !strcmp(propname, "linux,rtas-entry")) {
>
>
>
> [fstn1-p1 qemu-killslof]$ git grep 'strcmp.*==.*0' | wc -l
> 426
> [fstn1-p1 qemu-killslof]$ git grep '!strcmp' | wc -l
> 447
>
> My team is losing but not by much :) I prefer "==" (literally - "equal) to 
> "!" with "cmp" which is "does not compare" (makes little sense).

This may be personal preference but I also prefer using !strcmp for match 
(and less parenthesis :-) ) and have explicit != 0 for checking for not 
matching which is the less common. You had a few checks for not match 
above as "if (strcmp())"which now can be mistaken for checking for match. 
Using !strcmp might take a bit getting used to but once you do it's 
shorted and clearer.

Anyway, neither of these are strong points just a few comments. Sorry I 
did not have a chance to try the whole patch yet.

Regards,
BALATON Zoltan

