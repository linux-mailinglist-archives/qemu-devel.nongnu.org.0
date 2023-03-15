Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4996F6BADB8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 11:33:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcOQn-0002yu-FH; Wed, 15 Mar 2023 06:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcOQf-0002yZ-Pm
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 06:32:23 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcOQd-0006CD-CL
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 06:32:21 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so835060wmq.1
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 03:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678876337;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UrzsbJWVLmaC0SEXIUE5pNlnnS/e5D/bzgaigzCInZ0=;
 b=YfQEct+t4z1KaJu10UgXtDUuBwUl/w7z5vJ75ABcA0Gkh4US7r2301KgmoJ9NhrmiZ
 8Tj3RWZNCpZlSp69HtA0yW3gw0owEkFncckVpS7oNsJ8E+qjLR2xPvNMXUdVBYWhC3iT
 5bZiqFpyhJsl5CCAcx/zMQhoMYs57z60Dt+SDbc/6QASO81Iev1El1af5PJMlyzJfmbQ
 j+25GxUeNEAdjg2WTcTXXc+xoTPyLT8NGbOAiYEDynAZdQ3NWgWK2AumjbcO4HdoL2kw
 MvhfDRIWGVzedwHl8bgH0yw+D20KqUYpQ8GZMRUdPTJmahVi4GbiwQguFq1xF7cA7pdQ
 O+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678876337;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UrzsbJWVLmaC0SEXIUE5pNlnnS/e5D/bzgaigzCInZ0=;
 b=bVTZp92v/D6XuKXVhwJpdZJPqFKmGyxMz+fR4neAoDh5NnKZRKsjk3pUH/0maFhriR
 VsdIV02nrTWFg3wpIFngtLM0RiAISIkAXvUgb1t9kV4IbGdt1KeJvERCuncX7CX5w1Lz
 7T9o0hPLr46h6ulYN92KOBMPJEuCEC/e1c3oDyGOBjlIC57T8XC1uMwY+0Tadf7zLmgH
 ACPVn++uyQPafvVJr4Qi9cvNfCpq2BFx31i06JZGAgCg+zkm4cGQ1k78JJH51rTeP8T4
 XF/74QChi4CD3noeE+LdJ1fY5DN4EaCElbrHTwZlkiy3E/6iNNz6LAgd8JIfxzZKY2Y3
 IWPw==
X-Gm-Message-State: AO0yUKWkl3DW6Ab+4ddoL8ZvajvOqpfptQmA81v0Z5XFpTsKaIBysIfk
 +ERZRZfYr6sfBL44saEgdmZXXA==
X-Google-Smtp-Source: AK7set/RYAaiNUGb0cuIYXb49f/1sYgtGs2IPeE7mcCX7QKWn9mHpqmsX/liUxMmGYuANOGtLEK9yA==
X-Received: by 2002:a05:600c:358f:b0:3db:5f1:53a5 with SMTP id
 p15-20020a05600c358f00b003db05f153a5mr18769459wmq.20.1678876336914; 
 Wed, 15 Mar 2023 03:32:16 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z19-20020a1c4c13000000b003ed246c1d28sm1461900wmf.44.2023.03.15.03.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 03:32:16 -0700 (PDT)
Message-ID: <1f129089-6793-2e96-e6dd-f94bf66f3cde@linaro.org>
Date: Wed, 15 Mar 2023 11:32:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] qapi: Generate enum count as definition in
 gen_enum_lookup()
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230224155451.20211-1-philmd@linaro.org>
 <20230224155451.20211-3-philmd@linaro.org> <87ilfnqmnc.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87ilfnqmnc.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

T24gMjcvMi8yMyAxNDoxMCwgTWFya3VzIEFybWJydXN0ZXIgd3JvdGU6DQo+IFBoaWxpcHBl
IE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4gd3JpdGVzOg0KPiANCj4+IFFB
UEkncyBnZW5fZW51bSgpIGdlbmVyYXRlcyBRQVBJIGVudW0gdmFsdWVzIGFuZCB0aGUgbnVt
YmVyDQo+PiBvZiB0aGlzIHZhbHVlcyAoYXMgZm9vX19NQVgpLg0KPj4gVGhlIG51bWJlciBv
ZiBlbnRyaWVzIGluIGFuIGVudW0gdHlwZSBpcyBub3QgcGFydCBvZiB0aGUNCj4+IGVudW1l
cmF0ZWQgdmFsdWVzLCBidXQgd2UgZ2VuZXJhdGUgaXQgYXMgc3VjaC4gU2VlIGZvcg0KPj4g
ZXhhbXBsZToNCj4+DQo+PiAgICB0eXBlZGVmIGVudW0gT25PZmZBdXRvIHsNCj4+ICAgICAg
ICBPTl9PRkZfQVVUT19BVVRPLA0KPj4gICAgICAgIE9OX09GRl9BVVRPX09OLA0KPj4gICAg
ICAgIE9OX09GRl9BVVRPX09GRiwNCj4+ICAgICAgICBPTl9PRkZfQVVUT19fTUFYLCAgICAg
ICAgPC0tLS0tLS0tLQ0KPj4gICAgfSBPbk9mZkF1dG87DQo+Pg0KPj4gSW5zdGVhZCBvZiBk
ZWNsYXJpbmcgdGhlIGVudW0gY291bnQgYXMgdGhlIGxhc3QgZW51bWVyYXRlZA0KPj4gdmFs
dWUsICNkZWZpbmUgaXQsIHNvIGl0IGlzIG5vdCBwYXJ0IG9mIHRoZSBlbnVtLiBUaGUgcHJl
dmlvdXMNCj4+IGV4YW1wbGUgYmVjb21lczoNCj4+DQo+PiAgICB0eXBlZGVmIGVudW0gT25P
ZmZBdXRvIHsNCj4+ICAgICAgICBPTl9PRkZfQVVUT19BVVRPLA0KPj4gICAgICAgIE9OX09G
Rl9BVVRPX09OLA0KPj4gICAgICAgIE9OX09GRl9BVVRPX09GRiwNCj4+ICAgICNkZWZpbmUg
T05fT0ZGX0FVVE9fX01BWCAzICAgPC0tLS0tLS0tLQ0KPj4gICAgfSBPbk9mZkF1dG87DQo+
IA0KPiBJJ20gaW4gZmF2b3VyLiAgSW4gZmFjdCwgSSd2ZSB3YW50ZWQgdG8gZG8gdGhpcyBm
b3IgYSB3aGlsZSwganVzdCBuZXZlcg0KPiBnb3QgYXJvdW5kIHRvIGl0Lg0KPiANCj4+IFNp
bmNlIENsYW5nIGVuYWJsZXMgdGhlIC1Xc3dpdGNoIHdhcm5pbmcgYnkgZGVmYXVsdCBbKl0s
IHJlbW92ZSBhbGwNCj4+IHBvaW50bGVzcyBmb29fX01BWCBjYXNlcyBpbiBzd2l0Y2ggc3Rh
dGVtZW50LCBpbiBvcmRlciB0byBhdm9pZDoNCj4+DQo+PiAgIGF1ZGlvL2F1ZGlvLmM6MjIz
MToxMDogZXJyb3I6IGNhc2UgdmFsdWUgbm90IGluIGVudW1lcmF0ZWQgdHlwZSAnQXVkaW9G
b3JtYXQnIChha2EgJ2VudW0gQXVkaW9Gb3JtYXQnKSBbLVdzd2l0Y2hdDQo+PiAgICAgIGNh
c2UgQVVESU9fRk9STUFUX19NQVg6DQo+PiAgICAgICAgICAgXg0KPj4gICB1aS9pbnB1dC5j
OjIzMzoxNDogZXJyb3I6IGNhc2UgdmFsdWUgbm90IGluIGVudW1lcmF0ZWQgdHlwZSAnS2V5
VmFsdWVLaW5kJyAoYWthICdlbnVtIEtleVZhbHVlS2luZCcpIFstV3N3aXRjaF0NCj4+ICAg
ICAgICAgIGNhc2UgS0VZX1ZBTFVFX0tJTkRfX01BWDoNCj4+ICAgICAgICAgICAgICAgXg0K
Pj4gICAuLi4NCj4+DQo+PiBbKl0gaHR0cHM6Ly9jbGFuZy5sbHZtLm9yZy9kb2NzL0RpYWdu
b3N0aWNzUmVmZXJlbmNlLmh0bWwjd3N3aXRjaA0KPj4gU2lnbmVkLW9mZi1ieTogUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPg0KPiANCj4gRmFsbHMgYXBh
cnQgd2hlbiB0aGUgZW51bSBpcyBlbXB0eToNCj4gDQo+ICAgICAgZ2NjIC1tNjQgLW1jeDE2
IC1JcWdhL3FlbXUtZ2EucCAtSXFnYSAtSS4uL3FnYSAtSS4gLUlxYXBpIC1JdHJhY2UgLUl1
aSAtSXVpL3NoYWRlciAtSS91c3IvaW5jbHVkZS9nbGliLTIuMCAtSS91c3IvbGliNjQvZ2xp
Yi0yLjAvaW5jbHVkZSAtSS91c3IvaW5jbHVkZS9zeXNwcm9mLTQgLWZkaWFnbm9zdGljcy1j
b2xvcj1hdXRvIC1XYWxsIC1XaW52YWxpZC1wY2ggLXN0ZD1nbnUxMSAtTzAgLWcgLWlzeXN0
ZW0gL3dvcmsvYXJtYnJ1L3FlbXUvbGludXgtaGVhZGVycyAtaXN5c3RlbSBsaW51eC1oZWFk
ZXJzIC1pcXVvdGUgLiAtaXF1b3RlIC93b3JrL2FybWJydS9xZW11IC1pcXVvdGUgL3dvcmsv
YXJtYnJ1L3FlbXUvaW5jbHVkZSAtaXF1b3RlIC93b3JrL2FybWJydS9xZW11L3RjZy9pMzg2
IC1wdGhyZWFkIC1EX0dOVV9TT1VSQ0UgLURfRklMRV9PRkZTRVRfQklUUz02NCAtRF9MQVJH
RUZJTEVfU09VUkNFIC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1mbm8tY29tbW9uIC1md3JhcHYg
LVd1bmRlZiAtV3dyaXRlLXN0cmluZ3MgLVdtaXNzaW5nLXByb3RvdHlwZXMgLVdzdHJpY3Qt
cHJvdG90eXBlcyAtV3JlZHVuZGFudC1kZWNscyAtV29sZC1zdHlsZS1kZWNsYXJhdGlvbiAt
V29sZC1zdHlsZS1kZWZpbml0aW9uIC1XdHlwZS1saW1pdHMgLVdmb3JtYXQtc2VjdXJpdHkg
LVdmb3JtYXQteTJrIC1XaW5pdC1zZWxmIC1XaWdub3JlZC1xdWFsaWZpZXJzIC1XZW1wdHkt
Ym9keSAtV25lc3RlZC1leHRlcm5zIC1XZW5kaWYtbGFiZWxzIC1XZXhwYW5zaW9uLXRvLWRl
ZmluZWQgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD0yIC1XbWlzc2luZy1mb3JtYXQtYXR0cmli
dXRlIC1Xbm8tbWlzc2luZy1pbmNsdWRlLWRpcnMgLVduby1zaGlmdC1uZWdhdGl2ZS12YWx1
ZSAtV25vLXBzYWJpIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAtZlBJRSAtTUQgLU1RIHFn
YS9xZW11LWdhLnAvbWVzb24tZ2VuZXJhdGVkXy4uX3FnYS1xYXBpLWVtaXQtZXZlbnRzLmMu
byAtTUYgcWdhL3FlbXUtZ2EucC9tZXNvbi1nZW5lcmF0ZWRfLi5fcWdhLXFhcGktZW1pdC1l
dmVudHMuYy5vLmQgLW8gcWdhL3FlbXUtZ2EucC9tZXNvbi1nZW5lcmF0ZWRfLi5fcWdhLXFh
cGktZW1pdC1ldmVudHMuYy5vIC1jIHFnYS9xZ2EtcWFwaS1lbWl0LWV2ZW50cy5jDQo+ICAg
ICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHFnYS9xZ2EtcWFwaS1lbWl0LWV2ZW50cy5jOjE0
Og0KPiAgICAgIHFnYS9xZ2EtcWFwaS1lbWl0LWV2ZW50cy5oOjIwOjE6IGVycm9yOiBlbXB0
eSBlbnVtIGlzIGludmFsaWQNCj4gICAgICAgICAyMCB8IH0gcWdhX1FBUElFdmVudDsNCj4g
ICAgICAgICAgICB8IF4NCg0KV2hpbGUgSSBjb3VsZCBmaW5kIHRoYXQgaW4gdGhlIEMrKyBz
dGFuZGFyZCwgSSBjb3VsZG4ndCBpbiB0aGUgQyBvbmUuDQoNCkkgd29uZGVyIGlmIGluIHRo
YXQgY2FzZSBRQVBJIHNob3VsZCBnZW5lcmF0ZSBmb29fX01BWCA9IDAuIE5vIGNvZGUgLw0K
c3RydWN0dXJlIHNob3VsZCB1c2UgYW4gZW51bSB0eXBlIHdoaWNoIGRvZXNuJ3QgY29udGFp
biBhbnkgbWVtYmVyLi4uDQo=

