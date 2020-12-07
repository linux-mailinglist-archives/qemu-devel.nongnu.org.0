Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652C72D1297
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 14:54:26 +0100 (CET)
Received: from localhost ([::1]:52150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmGy9-0003Xf-Ew
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 08:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmGuQ-0002L6-M4
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:50:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmGuM-0004zt-QP
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:50:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607349029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eVbAk66Gc4i7/Y+mw8fEpb78Eumt7xdUubfVCaBoMBI=;
 b=VJPWIR+cp0N8oRIsBVGgrnsEQgMcB8q/cp+5o3lHKsmMo0GSpCZEFaeyTrFPJvk6weqHEH
 spmWEKsJT3IlP3BTRRhTVztsIgTPfMppxKyq+CK3DGAQqOfLkyFP/Rmc/BTtZUQBUa/T4c
 yo3wDyX4QXyP/dLbe3fq1PB+VoSveQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-8iG2LRJxOeeFIUEHEKeQzA-1; Mon, 07 Dec 2020 08:50:25 -0500
X-MC-Unique: 8iG2LRJxOeeFIUEHEKeQzA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F6D6809DC3;
 Mon,  7 Dec 2020 13:50:24 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9396060BE2;
 Mon,  7 Dec 2020 13:50:21 +0000 (UTC)
Subject: Re: [PATCH qemu v10] spapr: Implement Open Firmware client interface
To: BALATON Zoltan <balaton@eik.bme.hu>, Alexey Kardashevskiy <aik@ozlabs.ru>
References: <20201013021911.28701-1-aik@ozlabs.ru>
 <20201204193205.45d2a15a@bahia.lan>
 <c5cf97dd-d1aa-389a-2bff-5781a6af803e@ozlabs.ru>
 <7d3dadd5-af95-a270-d576-bbd327a97ece@eik.bme.hu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c4711ee7-4026-708e-ddbc-e29f028d726b@redhat.com>
Date: Mon, 7 Dec 2020 14:50:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <7d3dadd5-af95-a270-d576-bbd327a97ece@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/12/2020 11.26, BALATON Zoltan via wrote:
> On Mon, 7 Dec 2020, Alexey Kardashevskiy wrote:
>> On 05/12/2020 05:32, Greg Kurz wrote:
>>> On Tue, 13 Oct 2020 13:19:11 +1100
>>> Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>>
>>>> +static void readstr(hwaddr pa, char *buf, int size)
>>>> +{
>>>> +    cpu_physical_memory_read(pa, buf, size);
>>>> +    if (buf[size - 1] != '\0') {
>>>> +        buf[size - 1] = '\0';
>>>> +        if (strlen(buf) == size - 1) {
>>>> +            trace_spapr_of_client_error_str_truncated(buf, size);
>>>> +        }
>>>> +    }
>>>> +}
>>>> +
>>>> +static bool cmpservice(const char *s, size_t len,
>>>> +                       unsigned nargs, unsigned nret,
>>>> +                       const char *s1, size_t len1,
>>>> +                       unsigned nargscheck, unsigned nretcheck)
>>>> +{
>>>> +    if (strcmp(s, s1)) {
>>>> +        return false;
>>>> +    }
>>>> +    if ((nargscheck && (nargs != nargscheck)) ||
>>>> +        (nretcheck && (nret != nretcheck))) {
>>>
>>> Parenthesitis : != has precedence over &&.
>>
>>
>> I love my braces :)
> 
> Then keep them for yourself and not leave them around in code :-) I prefer
> minimum parenthesis too as that's easier to read and you can always look up
> operator precedence if in doubt so I'd vote for dropping them unless really
> needed or the compiler complains about it.

+1

Too many braces always rather confuse me than being helpful.

>>>> +static uint32_t of_client_setprop(SpaprMachineState *spapr,
>>>> +                                  uint32_t nodeph, uint32_t pname,
>>>> +                                  uint32_t valaddr, uint32_t vallen)
>>>> +{
>>>> +    char propname[OF_PROPNAME_LEN_MAX + 1];
>>>> +    uint32_t ret = -1;
>>>> +    int offset;
>>>> +    char trval[64] = "";
>>>> +
>>>> +    readstr(pname, propname, sizeof(propname));
>>>> +    /*
>>>> +     * We only allow changing properties which we know how to update on
>>>> +     * the QEMU side.
>>>> +     */
>>>> +    if (vallen == sizeof(uint32_t)) {
>>>> +        uint32_t val32 = ldl_be_phys(first_cpu->as, valaddr);
>>>> +
>>>> +        if ((strcmp(propname, "linux,rtas-base") == 0) ||
>>>> +            (strcmp(propname, "linux,rtas-entry") == 0)) {
>>>
>>> What about :
>>>
>>>          if (!strcmp(propname, "linux,rtas-base") ||
>>>              !strcmp(propname, "linux,rtas-entry")) {
>>
>>
>>
>> [fstn1-p1 qemu-killslof]$ git grep 'strcmp.*==.*0' | wc -l
>> 426
>> [fstn1-p1 qemu-killslof]$ git grep '!strcmp' | wc -l
>> 447
>>
>> My team is losing but not by much :) I prefer "==" (literally - "equal) to
>> "!" with "cmp" which is "does not compare" (makes little sense).
> 
> This may be personal preference but I also prefer using !strcmp for match
> (and less parenthesis :-) )

Easy solution: Simply use the glib variant g_str_equal() instead - that's
way much easier to understand while reading the code!

 Thomas


