Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DB3528DE4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 21:23:55 +0200 (CEST)
Received: from localhost ([::1]:47298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqgJu-0005nY-Md
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 15:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqgIU-0004vh-K8
 for qemu-devel@nongnu.org; Mon, 16 May 2022 15:22:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqgIQ-0000iE-Ox
 for qemu-devel@nongnu.org; Mon, 16 May 2022 15:22:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652728941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0/UmoQg/Yq9pVvqXmb7XCTnZpGjxces/wCzWHGOkoyk=;
 b=Px24qBYCAUK94yzNpJQgPaKOn9+nhOczbWWjDfvMIHlgX8Y82MA1BbhoDmcREIydUQPfI8
 Fn2fKv8rTCc2uNeiEujO7MhEZQN39GhpYXy0XMzXIzopwE0Vi/PgfkcjBNUjz4C85zDztT
 kFoOOF24TogSK3b3XXjEhQwq8Smq664=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-fY_EzUj1MwS-szV0MskELw-1; Mon, 16 May 2022 15:22:20 -0400
X-MC-Unique: fY_EzUj1MwS-szV0MskELw-1
Received: by mail-ed1-f70.google.com with SMTP id
 s9-20020aa7c549000000b0042ab6ab62f0so1879597edr.14
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 12:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0/UmoQg/Yq9pVvqXmb7XCTnZpGjxces/wCzWHGOkoyk=;
 b=pcq4Vkeb1Vhp+V1msYGbTJbJUjAmrxhoOLV7glfnIoHS9Tvy8bZdzcT/T5x0d4qdsU
 r5FwSbH6WRH8Oe8/uZR1lh7exAqRHzG0vBJhMPFvX1F6JS0necy4K2gODhKzO4TnHIaD
 D4L3ukhV6kmaD36cgUvFuXI6DwFNTzId0fWmYe6RPAO2w/UXmUr8GNl9P7Z2Mp6SoZrK
 GgnBtoySgfabebkcTfgVWHGRveR4s6odnGzVFM0zMTBg2DnspUw2yyjI7bXhLHJ14yoZ
 6wZGQaJy/dStZcs6vVrDL0tkwQ+1+d24ZPcVcYlaBOshyJU7MPFgQBVVWFBtFD8fhTAZ
 Gk3w==
X-Gm-Message-State: AOAM5316qBKoaT5SuoYOfjh8VhrGTRbn3mrWMxtpatJ70mslWNuMtyeA
 RS0P8OOLMreM/9zHrNYLP8PzJRRJYsJejmsjaYny4RlRcgVqMySE6B7ywSi2oJxcjmQyx7TmhQa
 kcW7HfBfky5qsxT4=
X-Received: by 2002:aa7:c14a:0:b0:42a:9ddd:2019 with SMTP id
 r10-20020aa7c14a000000b0042a9ddd2019mr12311488edp.43.1652728939182; 
 Mon, 16 May 2022 12:22:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmR8iQE0RVoxmK0EPQwbnHqQH4c1umw48Zt/t3LSc8rwX4vvnrvGe3I9BGINk//+0OFx8cBQ==
X-Received: by 2002:aa7:c14a:0:b0:42a:9ddd:2019 with SMTP id
 r10-20020aa7c14a000000b0042a9ddd2019mr12311464edp.43.1652728938929; 
 Mon, 16 May 2022 12:22:18 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 j13-20020a508a8d000000b0042617ba63cbsm5549863edj.85.2022.05.16.12.22.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 12:22:18 -0700 (PDT)
Message-ID: <f8cd57a9-d560-b483-c9ff-8ffde755e80e@redhat.com>
Date: Mon, 16 May 2022 21:22:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/3] capstone: Allow version 3.0.5 again
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220516145823.148450-1-thuth@redhat.com>
 <20220516145823.148450-3-thuth@redhat.com>
 <CAFEAcA-RBUX5iXV__1AMrex21DJK7hx8mygksJa6xynJRCEW4g@mail.gmail.com>
 <02b0c561-c93c-2ac8-7579-6c456c37771c@linaro.org>
 <CAFEAcA_Fqm7VL-ZoEuzmoQUDHqbOxKCG9s53GVy8hzDuET82yA@mail.gmail.com>
 <be93a9aa-4edf-3152-c225-19abc291afd2@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <be93a9aa-4edf-3152-c225-19abc291afd2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMTYvMDUvMjAyMiAyMS4xNCwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDUv
MTYvMjIgMDk6NTMsIFBldGVyIE1heWRlbGwgd3JvdGU6DQo+Pj4gaHR0cHM6Ly9saXN0cy5n
bnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMjAtMDkvbXNnMDc1NDIuaHRtbA0K
Pj4NCj4+IElzIHRoYXQgdGhpcyBvbmU/DQo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9x
ZW11LWRldmVsLzg3d28wbm8wd3ouZnNmQGxpbmFyby5vcmcvDQo+IA0KPiBDb3VsZCB3ZWxs
IGJlLg0KPiANCj4+DQo+PiBEaWQgd2UgZmluZCBvdXQgd2h5IFVidW50dSdzIGNhcHN0b25l
IGluIHBhcnRpY3VsYXIgZmVsbCBvdmVyID8NCj4gDQo+IEkgdmFndWVseSByZWNhbGwgdGhh
dCBpdCB3YXMgYSBzbmFwc2hvdCBvZiBhIGNhcHN0b25lIHByaW9yIHRvIHRoZSA0LjAgDQo+
IHJlbGVhc2UuwqAgVGhlIGVycm9yIG1lc3NhZ2UgeW91IHF1b3RlIGFib3ZlIGlzIGJlY2F1
c2UgQ0FQU1RPTkVfQVBJIGlzIG5vdCANCj4gZGVmaW5lZCB0byBzb21ldGhpbmcgcmVhc29u
YWJsZS7CoCBJIGRvbid0IGhhdmUgYW4gdWJ1bnR1IDE4IHN5c3RlbSB0byANCj4gcXVpY2ts
eSBsb29rIGF0Lg0KDQpJIGp1c3QgaGFkIGEgdHJ5IHdpdGggb3VyIFVidW50dSAxOC4wNCBk
b2NrZXIgY29udGFpbmVyIChhcyBpdCBoYXMgbm90IGJlZW4NCnJlbW92ZWQgeWV0KSBhbmQg
bXkgcGF0Y2hlcyBhcHBsaWVkOg0KDQokIG1ha2UgZG9ja2VyLXRlc3QtYnVpbGRAdWJ1bnR1
MTgwNCBcDQogICBFWFRSQV9DT05GSUdVUkVfT1BUUz0tLWVuYWJsZS1jYXBzdG9uZQ0KICAg
Li4uDQogICBEZXBlbmRlbmNpZXMNCiAgICAgLi4uDQogICAgIGNhcHN0b25lICAgICAgICAg
ICAgICAgICAgICAgOiBZRVMgMy4wLjQNCiAgICAgLi4uDQpbMTAyMy8zMzAxXSBDb21waWxp
bmcgQyBvYmplY3QgbGliY29tbW9uLmZhLnAvZGlzYXNfY2Fwc3RvbmUuYy5vDQpGQUlMRUQ6
IGxpYmNvbW1vbi5mYS5wL2Rpc2FzX2NhcHN0b25lLmMubw0KY2MgLW02NCAtbWN4MTYgLUls
aWJjb21tb24uZmEucCAtSS4uL3NyYy9jb21tb24tdXNlci9ob3N0L3g4Nl82NCAtSS4uL3Ny
Yy9kdGMvbGliZmR0IC1JLi4vc3JjL3NsaXJwIC1JLi4vc3JjL3NsaXJwL3NyYyAtSS91c3Iv
aW5jbHVkZS9jYXBzdG9uZSAtSS91c3IvaW5jbHVkZS9waXhtYW4tMSAtSS91c3IvaW5jbHVk
ZS9saWJwbmcxNiAtSS91c3IvaW5jbHVkZS9zcGljZS1zZXJ2ZXIgLUkvdXNyL2luY2x1ZGUv
c3BpY2UtMSAtSS91c3IvaW5jbHVkZS9wMTEta2l0LTEgLUkvdXNyL2luY2x1ZGUvbGlidXNi
LTEuMCAtSS91c3IvaW5jbHVkZS9TREwyIC1JL3Vzci9pbmNsdWRlL2dsaWItMi4wIC1JL3Vz
ci9saWIveDg2XzY0LWxpbnV4LWdudS9nbGliLTIuMC9pbmNsdWRlIC1JL3Vzci9pbmNsdWRl
L2dpby11bml4LTIuMC8gLUkvdXNyL2luY2x1ZGUvYWxzYSAtSS91c3IvaW5jbHVkZS92aXJn
bCAtSS91c3IvaW5jbHVkZS9uY3Vyc2VzdyAtSS91c3IvaW5jbHVkZS9ndGstMy4wIC1JL3Vz
ci9pbmNsdWRlL3BhbmdvLTEuMCAtSS91c3IvaW5jbHVkZS9jYWlybyAtSS91c3IvaW5jbHVk
ZS9mcmVldHlwZTIgLUkvdXNyL2luY2x1ZGUvaGFyZmJ1enogLUkvdXNyL2luY2x1ZGUvZ2Rr
LXBpeGJ1Zi0yLjAgLUkvdXNyL2luY2x1ZGUvYXRrLTEuMCAtSS91c3IvaW5jbHVkZS9hdC1z
cGkyLWF0ay8yLjAgLUkvdXNyL2luY2x1ZGUvYXQtc3BpLTIuMCAtSS91c3IvaW5jbHVkZS9k
YnVzLTEuMCAtSS91c3IvbGliL3g4Nl82NC1saW51eC1nbnUvZGJ1cy0xLjAvaW5jbHVkZSAt
SS91c3IvaW5jbHVkZS92dGUtMi45MSAtZmRpYWdub3N0aWNzLWNvbG9yPWF1dG8gLVdhbGwg
LVdpbnZhbGlkLXBjaCAtV2Vycm9yIC1zdGQ9Z251MTEgLU8yIC1nIC1pc3lzdGVtIC90bXAv
cWVtdS10ZXN0L3NyYy9saW51eC1oZWFkZXJzIC1pc3lzdGVtIGxpbnV4LWhlYWRlcnMgLWlx
dW90ZSAuIC1pcXVvdGUgL3RtcC9xZW11LXRlc3Qvc3JjIC1pcXVvdGUgL3RtcC9xZW11LXRl
c3Qvc3JjL2luY2x1ZGUgLWlxdW90ZSAvdG1wL3FlbXUtdGVzdC9zcmMvZGlzYXMvbGlidml4
bCAtaXF1b3RlIC90bXAvcWVtdS10ZXN0L3NyYy90Y2cvaTM4NiAtcHRocmVhZCAtVV9GT1JU
SUZZX1NPVVJDRSAtRF9GT1JUSUZZX1NPVVJDRT0yIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQg
LURfTEFSR0VGSUxFX1NPVVJDRSAtV3N0cmljdC1wcm90b3R5cGVzIC1XcmVkdW5kYW50LWRl
Y2xzIC1XdW5kZWYgLVd3cml0ZS1zdHJpbmdzIC1XbWlzc2luZy1wcm90b3R5cGVzIC1mbm8t
c3RyaWN0LWFsaWFzaW5nIC1mbm8tY29tbW9uIC1md3JhcHYgLVdvbGQtc3R5bGUtZGVjbGFy
YXRpb24gLVdvbGQtc3R5bGUtZGVmaW5pdGlvbiAtV3R5cGUtbGltaXRzIC1XZm9ybWF0LXNl
Y3VyaXR5IC1XZm9ybWF0LXkyayAtV2luaXQtc2VsZiAtV2lnbm9yZWQtcXVhbGlmaWVycyAt
V2VtcHR5LWJvZHkgLVduZXN0ZWQtZXh0ZXJucyAtV2VuZGlmLWxhYmVscyAtV2V4cGFuc2lv
bi10by1kZWZpbmVkIC1XaW1wbGljaXQtZmFsbHRocm91Z2g9MiAtV25vLW1pc3NpbmctaW5j
bHVkZS1kaXJzIC1Xbm8tc2hpZnQtbmVnYXRpdmUtdmFsdWUgLVduby1wc2FiaSAtZnN0YWNr
LXByb3RlY3Rvci1zdHJvbmcgLWZQSUUgLURfR05VX1NPVVJDRSAtRF9ERUZBVUxUX1NPVVJD
RSAtRE5DVVJTRVNfV0lERUNIQVI9MSAtRF9SRUVOVFJBTlQgLVduby11bmRlZiAtRFNUUlVD
VF9JT1ZFQ19ERUZJTkVEIC1NRCAtTVEgbGliY29tbW9uLmZhLnAvZGlzYXNfY2Fwc3RvbmUu
Yy5vIC1NRiBsaWJjb21tb24uZmEucC9kaXNhc19jYXBzdG9uZS5jLm8uZCAtbyBsaWJjb21t
b24uZmEucC9kaXNhc19jYXBzdG9uZS5jLm8gLWMgLi4vc3JjL2Rpc2FzL2NhcHN0b25lLmMN
Ci4uL3NyYy9kaXNhcy9jYXBzdG9uZS5jOjI1OjE6IGVycm9yOiBleHBlY3RlZCDigJg94oCZ
LCDigJgs4oCZLCDigJg74oCZLCDigJhhc23igJkgb3Ig4oCYX19hdHRyaWJ1dGVfX+KAmSBi
ZWZvcmUg4oCYY2FwX3NraXBkYXRhX3MzOTB4X2Ni4oCZDQogIGNhcF9za2lwZGF0YV9zMzkw
eF9jYihjb25zdCB1aW50OF90ICpjb2RlLCBzaXplX3QgY29kZV9zaXplLA0KICBefn5+fn5+
fn5+fn5+fn5+fn5+fn4NCi4uL3NyYy9kaXNhcy9jYXBzdG9uZS5jOjQ5OjE3OiBlcnJvcjog
4oCYY2FwX3NraXBkYXRhX3MzOTB4X2Ni4oCZIHVuZGVjbGFyZWQgaGVyZSAobm90IGluIGEg
ZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYY2FwX3NraXBkYXRhX3MzOTB44oCZPw0KICAg
ICAgLmNhbGxiYWNrID0gY2FwX3NraXBkYXRhX3MzOTB4X2NiDQogICAgICAgICAgICAgICAg
ICBefn5+fn5+fn5+fn5+fn5+fn5+fn4NCiAgICAgICAgICAgICAgICAgIGNhcF9za2lwZGF0
YV9zMzkweA0KbmluamE6IGJ1aWxkIHN0b3BwZWQ6IHN1YmNvbW1hbmQgZmFpbGVkLg0KTWFr
ZWZpbGU6MTYzOiByZWNpcGUgZm9yIHRhcmdldCAncnVuLW5pbmphJyBmYWlsZWQNCg0KU28g
aXQgc2VlbXMgbGlrZSByZWFsbHkgb25seSB0aGUgY2Fwc3RvbmUgMy4wLjQgZnJvbSBVYnVu
dHUgMTguMDQgaXMgYnJva2VuLA0Kd2hpbGUgdGhpcyBjb21waWxlcyBmaW5lIHdpdGggdGhl
IGNhcHN0b25lIDMuMC41IGZyb20gVWJ1bnR1IDIwLjA0Lg0KDQpJIHRoaW5rIG15IHBhdGNo
ZXMgc2hvdWxkIGJlIG9rIHRvIGFwcGx5IG5vdyB0aGF0IHdlIGRyb3BwZWQgc3VwcG9ydA0K
Zm9yIFVidW50dSAxOC4wNC4NCg0KICBUaG9tYXMNCg==


