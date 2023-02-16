Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F0A699923
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 16:43:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgOH-0002hN-U1; Thu, 16 Feb 2023 10:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pSgOF-0002hD-A0
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 10:41:43 -0500
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pSgO7-0004CR-O1
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 10:41:43 -0500
Received: by mail-qt1-x82d.google.com with SMTP id h24so2605023qtr.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 07:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:user-agent:references
 :from:mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U03bU6klruJTS7Ay7q4AzrhgbNbgeDqH9kcKxfNozjk=;
 b=a+SHeMsy+qdk7ce8qejQZoK8o6X3o1Q0bdhjgtTY+TF3boXAX1K2PnmlvfZbvmG6gn
 KjGuupqHBfHHSZs3NkYiKdVbCojT9N0weYfm9PZsRyWC+00eFmAkt/Ih0MlWT+Tjheet
 JWFXNcw5F3iYxwgYJ9kt4RwtF129H/5tYeGok0NwlZhxylNokmtBoHYZt4g5VR7a2QpW
 i63nhozjZs1tHerLvyixxNyQItyTBkOWtMx+phX/hMkfYPxu2SMSXzV4kOgRdlDWOJc7
 DGiWGbNC68WC7qQhXe1fHdenQxMyBgYqDIGEaUfCgmrOZB9yULBX8JYP9telpA72mBLg
 OrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:user-agent:references
 :from:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U03bU6klruJTS7Ay7q4AzrhgbNbgeDqH9kcKxfNozjk=;
 b=YJTWatsJ0hNKaklDuGJA1ZPPAS+swFLuzWIWfnTVrtmmB9KlXu4SLTamJAsk5aVOI5
 qTAbx1JqobUIBcJ3pOkdKfu1MOfmMMZISAGGGFkaRFofUaIkg+YhXMFxMfneUsXYbfjn
 +dOdALqDQ4PTn9p7ebDKUaXnY/aRJLW6NhM7CpTzpWpwJtL744pDJ95amnFKdvdedxNU
 iA8m+WOH1Xrt3ODQxehOXhsQgiZUPUZ0k5mqAwmvdMtSE4nZbMVB0dlklfltI1l7AaRB
 9AI5/6UtN4LneChn9LT/JcNV8jzciauTMjgMvp96+FoAGnhS0Nz5kw6VNsGHtHw9yDSI
 fnlA==
X-Gm-Message-State: AO0yUKV6WlL1j7H9ns3oHj5q6ObNS+tC3HlNij7KVUduR1JVaBFwqJCO
 9rvGCll7JucVb6Ltu1nbSM3uaUI8jKJ8vIG9Zdhodg==
X-Google-Smtp-Source: AK7set+rOf+LYA1Yjt5jgohdS46MmlOMwS0H8AXp1OiUaN/ZcmH9KRQVMSxt6mRACpFo/ikyTfLscTdoAWtOGHrThUI=
X-Received: by 2002:a05:622a:487:b0:3ba:1ea6:d99c with SMTP id
 p7-20020a05622a048700b003ba1ea6d99cmr536743qtx.405.1676562087182; Thu, 16 Feb
 2023 07:41:27 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST; 
 Thu, 16 Feb 2023 09:41:26 -0600
Mime-Version: 1.0
From: Chuang Xu <xuchuangxclwt@bytedance.com>
References: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
 <877cwizqvy.fsf@secure.mitica>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
In-Reply-To: <877cwizqvy.fsf@secure.mitica>
Date: Thu, 16 Feb 2023 09:41:26 -0600
Message-ID: <CALophusFDQ9Gt_oeYyGMT2NjZSbeapQExakpTF1B40RB5kgkcA@mail.gmail.com>
Subject: Re: [RFC v5 0/3] migration: reduce time of loading non-iterable
 vmstate
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, 
 zhouyibo@bytedance.com
Content-Type: multipart/alternative; boundary="000000000000a6a16105f4d307e0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FORGED_MUA_MOZILLA=2.309, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.649, HTML_MESSAGE=0.001, NICE_REPLY_A=-0.351,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--000000000000a6a16105f4d307e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGksIEp1YW4NCg0KVGhhbmtzIGZvciB5b3VyIHRlc3QgcmVzdWx0cyENCg0KT24gMjAyMy8yLzE2
IOS4iuWNiDM6MTAsIEp1YW4gUXVpbnRlbGEgd3JvdGU6DQo+IENodWFuZyBYdSB3cm90ZToNCj4+
IEluIHRoaXMgdmVyc2lvbjoNCj4gSGkNCj4NCj4gSSBoYWQgdG8gZHJvcCB0aGlzLiBJdCBicmVh
a3MgbWlncmF0aW9uIG9mIGRidXMtdm1zdGF0ZS4NCg0KUHJldmlvdXNseSwgSSBvbmx5IGZvY3Vz
ZWQgb24gdGhlIHByZWNvcHkgbWlncmF0aW9uIHRlc3QNCmluIHRoZSBub3JtYWwgc2NlbmFyaW8s
IGJ1dCBkaWQgbm90IHJ1biBxdGVzdC4gU28gSSBuZWVkIHRvDQphcG9sb2dpemUgZm9yIG15IGlu
ZXhwZXJpZW5jZS4uDQoNCj4NCj4gLltLMTQ0LzE3OSBxZW11OnF0ZXN0K3F0ZXN0LXg4Nl82NCAv
IHF0ZXN0LXg4Nl82NC92aXJ0aW8tbmV0LWZhaWxvdmVyDQpFUlJPUiA1LjY2cyBraWxsZWQgYnkg
c2lnbmFsIDYgU0lHQUJSVA0KPj4+PiBHX1RFU1RfREJVU19EQUVNT049L21udC9jb2RlL3FlbXUv
bXVsdGlmZC90ZXN0cy9kYnVzLXZtc3RhdGUtZGFlbW9uLnNoDQpRVEVTVF9RRU1VX0JJTkFSWT0u
L3FlbXUtc3lzdGVtLXg4Nl82NCBNQUxMT0NfUEVSVFVSQl89MTQ1DQovc2NyYXRjaC9xZW11L211
bHRpZmQveDY0L3Rlc3RzL3F0ZXN0L3ZpcnRpby1uZXQtZmFpbG92ZXIgLS10YXAgLWsNCj4NCuKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAlQ0K4pyADQrigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJUNCg0KPiBzdGRl
cnI6DQo+IHFlbXUtc3lzdGVtLXg4Nl82NDogL21udC9jb2RlL3FlbXUvbXVsdGlmZC9pbmNsdWRl
L2V4ZWMvbWVtb3J5Lmg6MTExMjoNCmFkZHJlc3Nfc3BhY2VfdG9fZmxhdHZpZXc6IEFzc2VydGlv
bg0KYCghbWVtb3J5X3JlZ2lvbl90cmFuc2FjdGlvbl9pbl9wcm9ncmVzcygpICYmIHFlbXVfbXV0
ZXhfaW90aHJlYWRfbG9ja2VkKCkpDQp8fCByY3VfcmVhZF9pc19sb2NrZWQoKScgZmFpbGVkLg0K
PiBCcm9rZW4gcGlwZQ0KPiAuLi8uLi8uLi8uLi9tbnQvY29kZS9xZW11L211bHRpZmQvdGVzdHMv
cXRlc3QvbGlicXRlc3QuYzoxOTA6IGtpbGxfcWVtdSgpDQpkZXRlY3RlZCBRRU1VIGRlYXRoIGZy
b20gc2lnbmFsIDYgKEFib3J0ZWQpIChjb3JlIGR1bXBlZCkNCj4NCj4gKHRlc3QgcHJvZ3JhbSBl
eGl0ZWQgd2l0aCBzdGF0dXMgY29kZSAtNikNCj4NCj4gVEFQIHBhcnNpbmcgZXJyb3I6IFRvbyBm
ZXcgdGVzdHMgcnVuIChleHBlY3RlZCAyMywgZ290IDEyKQ0KPg0K4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCVDQoNCj4NCj4gQ2FuIHlvdSB0YWtl
IGEgbG9vayBhdCB0aGlzPw0KPg0KPiBJIHJlcHJvZHVjZWQgaXQgd2l0aCAibWFrZSBjaGVjayIg
YW5kIHFlbXUgY29tcGlsZWQgd2l0aCB0aGUgY29uZmlndXJlDQo+IGxpbmUgYXR0YWNoZWQuDQo+
DQo+IExhdGVyLCBKdWFuLg0KPg0KPiBjb25maWd1cmUgLS1lbmFibGUtdHJhY2UtYmFja2VuZHM9
bG9nDQo+IC0tcHJlZml4PS91c3INCj4gLS1zeXNjb25mZGlyPS9ldGMvc3lzY29uZmlnLw0KPiAt
LWF1ZGlvLWRydi1saXN0PXBhDQo+IC0tdGFyZ2V0LWxpc3Q9eDg2XzY0LXNvZnRtbXUNCj4gLS13
aXRoLWNvcm91dGluZT11Y29udGV4dA0KPiAtLXdpdGgtZ2l0LXN1Ym1vZHVsZXM9dmFsaWRhdGUN
Cj4gLS1lbmFibGUtZmR0PXN5c3RlbQ0KPiAtLWVuYWJsZS1hbHNhDQo+IC0tZW5hYmxlLWF0dHIN
Cj4gLS1lbmFibGUtYXV0aC1wYW0NCj4gLS1lbmFibGUtYXZ4Mg0KPiAtLWVuYWJsZS1hdng1MTJm
DQo+IC0tZW5hYmxlLWJvY2hzDQo+IC0tZW5hYmxlLWJwZg0KPiAtLWVuYWJsZS1icmxhcGkNCj4g
LS1kaXNhYmxlLWJzZC11c2VyDQo+IC0tZW5hYmxlLWJ6aXAyDQo+IC0tZW5hYmxlLWNhcC1uZw0K
PiAtLWRpc2FibGUtY2Fwc3RvbmUNCj4gLS1kaXNhYmxlLWNmaQ0KPiAtLWRpc2FibGUtY2ZpLWRl
YnVnDQo+IC0tZW5hYmxlLWNsb29wDQo+IC0tZGlzYWJsZS1jb2NvYQ0KPiAtLWVuYWJsZS1jb250
YWluZXJzDQo+IC0tZGlzYWJsZS1jb3JlYXVkaW8NCj4gLS1lbmFibGUtY29yb3V0aW5lLXBvb2wN
Cj4gLS1lbmFibGUtY3J5cHRvLWFmYWxnDQo+IC0tZW5hYmxlLWN1cmwNCj4gLS1lbmFibGUtY3Vy
c2VzDQo+IC0tZW5hYmxlLWRidXMtZGlzcGxheQ0KPiAtLWVuYWJsZS1kZWJ1Zy1pbmZvDQo+IC0t
ZGlzYWJsZS1kZWJ1Zy1tdXRleA0KPiAtLWRpc2FibGUtZGVidWctc3RhY2stdXNhZ2UNCj4gLS1k
aXNhYmxlLWRlYnVnLXRjZw0KPiAtLWVuYWJsZS1kbWcNCj4gLS1kaXNhYmxlLWRvY3MNCj4gLS1k
aXNhYmxlLWRzb3VuZA0KPiAtLWVuYWJsZS1mZHQNCj4gLS1kaXNhYmxlLWZ1c2UNCj4gLS1kaXNh
YmxlLWZ1c2UtbHNlZWsNCj4gLS1kaXNhYmxlLWZ1enppbmcNCj4gLS1kaXNhYmxlLWdjb3YNCj4g
LS1lbmFibGUtZ2V0dGV4dA0KPiAtLWVuYWJsZS1naW8NCj4gLS1lbmFibGUtZ2x1c3RlcmZzDQo+
IC0tZW5hYmxlLWdudXRscw0KPiAtLWRpc2FibGUtZ3Byb2YNCj4gLS1lbmFibGUtZ3RrDQo+IC0t
ZGlzYWJsZS1ndWVzdC1hZ2VudA0KPiAtLWRpc2FibGUtZ3Vlc3QtYWdlbnQtbXNpDQo+IC0tZGlz
YWJsZS1oYXgNCj4gLS1kaXNhYmxlLWh2Zg0KPiAtLWVuYWJsZS1pY29udg0KPiAtLWVuYWJsZS1p
bnN0YWxsLWJsb2JzDQo+IC0tZW5hYmxlLWphY2sNCj4gLS1lbmFibGUta2V5cmluZw0KPiAtLWVu
YWJsZS1rdm0NCj4gLS1lbmFibGUtbDJ0cHYzDQo+IC0tZW5hYmxlLWxpYmRheGN0bA0KPiAtLWVu
YWJsZS1saWJpc2NzaQ0KPiAtLWVuYWJsZS1saWJuZnMNCj4gLS1lbmFibGUtbGlicG1lbQ0KPiAt
LWVuYWJsZS1saWJzc2gNCj4gLS1lbmFibGUtbGlidWRldg0KPiAtLWVuYWJsZS1saWJ1c2INCj4g
LS1lbmFibGUtbGludXgtYWlvDQo+IC0tZW5hYmxlLWxpbnV4LWlvLXVyaW5nDQo+IC0tZGlzYWJs
ZS1saW51eC11c2VyDQo+IC0tZW5hYmxlLWxpdmUtYmxvY2stbWlncmF0aW9uDQo+IC0tZGlzYWJs
ZS1sdG8NCj4gLS1kaXNhYmxlLWx6ZnNlDQo+IC0tZW5hYmxlLWx6bw0KPiAtLWRpc2FibGUtbWFs
bG9jLXRyaW0NCj4gLS1lbmFibGUtbWVtYmFycmllcg0KPiAtLWVuYWJsZS1tb2R1bGUtdXBncmFk
ZXMNCj4gLS1lbmFibGUtbW9kdWxlcw0KPiAtLWVuYWJsZS1tcGF0aA0KPiAtLWVuYWJsZS1tdWx0
aXByb2Nlc3MNCj4gLS1kaXNhYmxlLW5ldG1hcA0KPiAtLWVuYWJsZS1uZXR0bGUNCj4gLS1lbmFi
bGUtbnVtYQ0KPiAtLWRpc2FibGUtbnZtbQ0KPiAtLWVuYWJsZS1vcGVuZ2wNCj4gLS1lbmFibGUt
b3NzDQo+IC0tZW5hYmxlLXBhDQo+IC0tZW5hYmxlLXBhcmFsbGVscw0KPiAtLWVuYWJsZS1waWUN
Cj4gLS1lbmFibGUtcGx1Z2lucw0KPiAtLWVuYWJsZS1wbmcNCj4gLS1kaXNhYmxlLXByb2ZpbGVy
DQo+IC0tZW5hYmxlLXB2cmRtYQ0KPiAtLWVuYWJsZS1xY293MQ0KPiAtLWVuYWJsZS1xZWQNCj4g
LS1kaXNhYmxlLXFvbS1jYXN0LWRlYnVnDQo+IC0tZW5hYmxlLXJiZA0KPiAtLWVuYWJsZS1yZG1h
DQo+IC0tZW5hYmxlLXJlcGxpY2F0aW9uDQo+IC0tZW5hYmxlLXJuZy1ub25lDQo+IC0tZGlzYWJs
ZS1zYWZlLXN0YWNrDQo+IC0tZGlzYWJsZS1zYW5pdGl6ZXJzDQo+IC0tZW5hYmxlLXN0YWNrLXBy
b3RlY3Rvcg0KPiAtLWVuYWJsZS1zZGwNCj4gLS1lbmFibGUtc2RsLWltYWdlDQo+IC0tZW5hYmxl
LXNlY2NvbXANCj4gLS1lbmFibGUtc2VsaW51eA0KPiAtLWVuYWJsZS1zbGlycA0KPiAtLWVuYWJs
ZS1zbGlycC1zbWJkDQo+IC0tZW5hYmxlLXNtYXJ0Y2FyZA0KPiAtLWVuYWJsZS1zbmFwcHkNCj4g
LS1lbmFibGUtc3BhcnNlDQo+IC0tZW5hYmxlLXNwaWNlDQo+IC0tZW5hYmxlLXNwaWNlLXByb3Rv
Y29sDQo+IC0tZW5hYmxlLXN5c3RlbQ0KPiAtLWVuYWJsZS10Y2cNCj4gLS1kaXNhYmxlLXRjZy1p
bnRlcnByZXRlcg0KPiAtLWRpc2FibGUtdG9vbHMNCj4gLS1lbmFibGUtdHBtDQo+IC0tZGlzYWJs
ZS10c2FuDQo+IC0tZGlzYWJsZS11MmYNCj4gLS1lbmFibGUtdXNiLXJlZGlyDQo+IC0tZGlzYWJs
ZS11c2VyDQo+IC0tZGlzYWJsZS12ZGUNCj4gLS1lbmFibGUtdmRpDQo+IC0tZW5hYmxlLXZob3N0
LWNyeXB0bw0KPiAtLWVuYWJsZS12aG9zdC1rZXJuZWwNCj4gLS1lbmFibGUtdmhvc3QtbmV0DQo+
IC0tZW5hYmxlLXZob3N0LXVzZXINCj4gLS1lbmFibGUtdmhvc3QtdXNlci1ibGstc2VydmVyDQo+
IC0tZW5hYmxlLXZob3N0LXZkcGENCj4gLS1lbmFibGUtdmlyZ2xyZW5kZXJlcg0KPiAtLWVuYWJs
ZS12aXJ0ZnMNCj4gLS1lbmFibGUtdmlydGlvZnNkDQo+IC0tZW5hYmxlLXZuYw0KPiAtLWVuYWJs
ZS12bmMtanBlZw0KPiAtLWVuYWJsZS12bmMtc2FzbA0KPiAtLWVuYWJsZS12dGUNCj4gLS1lbmFi
bGUtdnZmYXQNCj4gLS1lbmFibGUtd2Vycm9yDQo+IC0tZGlzYWJsZS13aHB4DQo+IC0tZW5hYmxl
LXhlbg0KPiAtLWVuYWJsZS14ZW4tcGNpLXBhc3N0aHJvdWdoDQo+IC0tZW5hYmxlLXhrYmNvbW1v
bg0KPiAtLWVuYWJsZS16c3RkDQo+IC0tZGlzYWJsZS1nY3J5cHQNCg0KSSByYW4gcXRlc3Qgd2l0
aCByZWZlcmVuY2UgdG8geW91ciBlbnZpcm9ubWVudCwgYW5kIGZpbmFsbHkgcmVwb3J0ZWQgdHdv
DQplcnJvcnMuDQoNCkVycm9yIDEodGhlIHNhbWUgYXMgeW91cnMpOg0KDQpRVEVTVF9RRU1VX0JJ
TkFSWT0uL3FlbXUtc3lzdGVtLXg4Nl82NCBNQUxMT0NfUEVSVFVSQl89ODcNCkdfVEVTVF9EQlVT
X0RBRU1PTj0vZGF0YTAwL21pZ3JhdGlvbi9xZW11LW9wZW4vdGVzdHMvZGJ1cy12bXN0YXRlLWRh
ZW1vbi5zaA0KL2RhdGEwMC9taWdyYXRpb24vcWVtdS1vcGVuL2J1aWxkL3Rlc3RzL3F0ZXN0L3Zp
cnRpby1uZXQtZmFpbG92ZXIgLS10YXAgLWsNCuKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAlQ0K4pyADQrigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJUNCg0Kc3RkZXJyOg0KcWVtdS1zeXN0
ZW0teDg2XzY0OiAvZGF0YTAwL21pZ3JhdGlvbi9xZW11LW9wZW4vaW5jbHVkZS9leGVjL21lbW9y
eS5oOjExMTQ6DQphZGRyZXNzX3NwYWNlX3RvX2ZsYXR2aWV3OiBBc3NlcnRpb24NCmAoIW1lbW9y
eV9yZWdpb25fdHJhbnNhY3Rpb25faW5fcHJvZ3Jlc3MoKSAmJiBxZW11X211dGV4X2lvdGhyZWFk
X2xvY2tlZCgpKQ0KfHwgcmN1X3JlYWRfaXNfbG9ja2VkKCknIGZhaWxlZC4NCkJyb2tlbiBwaXBl
DQouLi90ZXN0cy9xdGVzdC9saWJxdGVzdC5jOjE5MDoga2lsbF9xZW11KCkgZGV0ZWN0ZWQgUUVN
VSBkZWF0aCBmcm9tIHNpZ25hbA0KNiAoQWJvcnRlZCkgKGNvcmUgZHVtcGVkKQ0KDQoodGVzdCBw
cm9ncmFtIGV4aXRlZCB3aXRoIHN0YXR1cyBjb2RlIC02KQ0KDQpUQVAgcGFyc2luZyBlcnJvcjog
VG9vIGZldyB0ZXN0cyBydW4gKGV4cGVjdGVkIDIzLCBnb3QgMTIpDQoNCkNvcmVkdW1wIGJhY2t0
cmFjZToNCiMwIF9fR0lfcmFpc2UgKHNpZz1zaWdAZW50cnk9NikgYXQgLi4vc3lzZGVwcy91bml4
L3N5c3YvbGludXgvcmFpc2UuYzo1MA0KIzEgMHgwMDAwN2YzYWY2NGE4NTM1IGluIF9fR0lfYWJv
cnQgKCkgYXQgYWJvcnQuYzo3OQ0KIzIgMHgwMDAwN2YzYWY2NGE4NDBmIGluIF9fYXNzZXJ0X2Zh
aWxfYmFzZSAoZm10PTB4N2YzYWY2NjA5ZWYwICIlcyVzJXM6JXU6DQolcyVzQXNzZXJ0aW9uIGAl
cycgZmFpbGVkLlxuJW4iLCBhc3NlcnRpb249MHg1NWQ5NDI1ZjQ4YTgNCiIoIW1lbW9yeV9yZWdp
b25fdHJhbnNhY3Rpb25faW5fcHJvZ3Jlc3MoKSAmJiBxZW11X211dGV4X2lvdGhyZWFkX2xvY2tl
ZCgpKQ0KfHwgcmN1X3JlYWRfaXNfbG9ja2VkKCkiLA0KZmlsZT0weDU1ZDk0MjVmNDg3MCAiL2Rh
dGEwMC9taWdyYXRpb24vcWVtdS1vcGVuL2luY2x1ZGUvZXhlYy9tZW1vcnkuaCIsDQpsaW5lPTEx
MTQsIGZ1bmN0aW9uPSkgYXQgYXNzZXJ0LmM6OTINCiMzIDB4MDAwMDdmM2FmNjRiNjFhMiBpbiBf
X0dJX19fYXNzZXJ0X2ZhaWwNCihhc3NlcnRpb249YXNzZXJ0aW9uQGVudHJ5PTB4NTVkOTQyNWY0
OGE4DQoiKCFtZW1vcnlfcmVnaW9uX3RyYW5zYWN0aW9uX2luX3Byb2dyZXNzKCkgJiYgcWVtdV9t
dXRleF9pb3RocmVhZF9sb2NrZWQoKSkNCnx8IHJjdV9yZWFkX2lzX2xvY2tlZCgpIiwNCmZpbGU9
ZmlsZUBlbnRyeT0weDU1ZDk0MjVmNDg3MA0KIi9kYXRhMDAvbWlncmF0aW9uL3FlbXUtb3Blbi9p
bmNsdWRlL2V4ZWMvbWVtb3J5LmgiLCBsaW5lPWxpbmVAZW50cnk9MTExNCwNCmZ1bmN0aW9uPWZ1
bmN0aW9uQGVudHJ5PTB4NTVkOTQyNmNkY2UwIDxfX1BSRVRUWV9GVU5DVElPTl9fLjIwMDM5Pg0K
ImFkZHJlc3Nfc3BhY2VfdG9fZmxhdHZpZXciKSBhdCBhc3NlcnQuYzoxMDENCiM0IDB4MDAwMDU1
ZDk0MjM3Mzg1MyBpbiBhZGRyZXNzX3NwYWNlX3RvX2ZsYXR2aWV3IChhcz0weDU1ZDk0NDczODY0
OCkgYXQNCi9kYXRhMDAvbWlncmF0aW9uL3FlbXUtb3Blbi9pbmNsdWRlL2V4ZWMvbWVtb3J5Lmg6
MTExMg0KIzUgMHgwMDAwNTVkOTQyMzc0NmY1IGluIGFkZHJlc3Nfc3BhY2VfdG9fZmxhdHZpZXcg
KGFzPTB4NTVkOTQ0NzM4NjQ4KSBhdA0KL2RhdGEwMC9taWdyYXRpb24vcWVtdS1vcGVuL2luY2x1
ZGUvcWVtdS9yY3UuaDoxMjYNCiM2IGFkZHJlc3Nfc3BhY2Vfc2V0X2ZsYXR2aWV3IChhcz1hc0Bl
bnRyeT0weDU1ZDk0NDczODY0OCkgYXQNCi4uL3NvZnRtbXUvbWVtb3J5LmM6MTAyOQ0KIzcgMHgw
MDAwNTVkOTQyMzdhY2UzIGluIGFkZHJlc3Nfc3BhY2VfdXBkYXRlX3RvcG9sb2d5IChhcz0weDU1
ZDk0NDczODY0OCkNCmF0IC4uL3NvZnRtbXUvbWVtb3J5LmM6MTA4MA0KIzggYWRkcmVzc19zcGFj
ZV9pbml0IChhcz1hc0BlbnRyeT0weDU1ZDk0NDczODY0OCwNCnJvb3Q9cm9vdEBlbnRyeT0weDU1
ZDk0NDczODZhMCwNCm5hbWU9bmFtZUBlbnRyeT0weDU1ZDk0NDczODRmMCAidmlydGlvLW5ldC1w
Y2kiKSBhdA0KLi4vc29mdG1tdS9tZW1vcnkuYzozMDgyDQojOSAweDAwMDA1NWQ5NDIxNTFlNDMg
aW4gZG9fcGNpX3JlZ2lzdGVyX2RldmljZSAoZXJycD0weDdmM2FlZjdmZTg1MCwNCmRldmZuPSwg
bmFtZT0weDU1ZDk0NDRiNmM0MCAidmlydGlvLW5ldC1wY2kiLCBwY2lfZGV2PTB4NTVkOTQ0NzM4
NDEwKSBhdA0KLi4vaHcvcGNpL3BjaS5jOjExNDUNCiMxMCBwY2lfcWRldl9yZWFsaXplIChxZGV2
PTB4NTVkOTQ0NzM4NDEwLCBlcnJwPTB4N2YzYWVmN2ZlODUwKSBhdA0KLi4vaHcvcGNpL3BjaS5j
OjIwMzYNCiMxMSAweDAwMDA1NWQ5NDI0MDRhOGYgaW4gZGV2aWNlX3NldF9yZWFsaXplZCAob2Jq
PSwgdmFsdWU9dHJ1ZSwNCmVycnA9MHg3ZjNhZWY3ZmVhZTApIGF0IC4uL2h3L2NvcmUvcWRldi5j
OjUxMA0KIzEyIDB4MDAwMDU1ZDk0MjQwN2UzNiBpbiBwcm9wZXJ0eV9zZXRfYm9vbCAob2JqPTB4
NTVkOTQ0NzM4NDEwLCB2PSwgbmFtZT0sDQpvcGFxdWU9MHg1NWQ5NDQ0YzcxZDAsIGVycnA9MHg3
ZjNhZWY3ZmVhZTApIGF0IC4uL3FvbS9vYmplY3QuYzoyMjg1DQojMTMgMHgwMDAwNTVkOTQyNDBh
MGUzIGluIG9iamVjdF9wcm9wZXJ0eV9zZXQgKG9iaj1vYmpAZW50cnk9MHg1NWQ5NDQ3Mzg0MTAs
DQpuYW1lPW5hbWVAZW50cnk9MHg1NWQ5NDI2NzBjMjMgInJlYWxpemVkIiwgdj12QGVudHJ5PTB4
NTVkOTQ1MmY3YTAwLA0KZXJycD1lcnJwQGVudHJ5PTB4N2YzYWVmN2ZlYWUwKSBhdCAuLi9xb20v
b2JqZWN0LmM6MTQyMA0KIzE0IDB4MDAwMDU1ZDk0MjQwZDE1ZiBpbiBvYmplY3RfcHJvcGVydHlf
c2V0X3FvYmplY3QNCihvYmo9b2JqQGVudHJ5PTB4NTVkOTQ0NzM4NDEwLA0KbmFtZT1uYW1lQGVu
dHJ5PTB4NTVkOTQyNjcwYzIzICJyZWFsaXplZCIsIHZhbHVlPXZhbHVlQGVudHJ5PTB4NTVkOTQ1
MzA2Y2IwLA0KZXJycD1lcnJwQGVudHJ5PTB4N2YzYWVmN2ZlYWUwKSBhdCAuLi9xb20vcW9tLXFv
YmplY3QuYzoyOA0KIzE1IDB4MDAwMDU1ZDk0MjQwYTM1NCBpbiBvYmplY3RfcHJvcGVydHlfc2V0
X2Jvb2wgKG9iaj0weDU1ZDk0NDczODQxMCwNCm5hbWU9bmFtZUBlbnRyeT0weDU1ZDk0MjY3MGMy
MyAicmVhbGl6ZWQiLCB2YWx1ZT12YWx1ZUBlbnRyeT10cnVlLA0KZXJycD1lcnJwQGVudHJ5PTB4
N2YzYWVmN2ZlYWUwKSBhdCAuLi9xb20vb2JqZWN0LmM6MTQ4OQ0KIzE2IDB4MDAwMDU1ZDk0MjQw
NDI3YyBpbiBxZGV2X3JlYWxpemUgKGRldj0sIGJ1cz1idXNAZW50cnk9MHg1NWQ5NDUxNDE0MDAs
DQplcnJwPWVycnBAZW50cnk9MHg3ZjNhZWY3ZmVhZTApIGF0IC4uL2h3L2NvcmUvcWRldi5jOjI5
Mg0KIzE3IDB4MDAwMDU1ZDk0MjFlZjRhMCBpbiBxZGV2X2RldmljZV9hZGRfZnJvbV9xZGljdCAo
b3B0cz0weDU1ZDk0NTMwOWMwMCwNCmZyb21fanNvbj0sIGVycnA9LCBlcnJwQGVudHJ5PTB4N2Yz
YWVmN2ZlYWUwKSBhdA0KL2RhdGEwMC9taWdyYXRpb24vcWVtdS1vcGVuL2luY2x1ZGUvaHcvcWRl
di1jb3JlLmg6MTcNCiMxOCAweDAwMDA1NWQ5NDIzMTFjODUgaW4gZmFpbG92ZXJfYWRkX3ByaW1h
cnkgKGVycnA9MHg3ZjNhZWY3ZmVhZDgsDQpuPTB4NTVkOTQ1NGU4NTMwKSBhdCAuLi9ody9uZXQv
dmlydGlvLW5ldC5jOjkzMw0KIzE5IHZpcnRpb19uZXRfc2V0X2ZlYXR1cmVzICh2ZGV2PSwgZmVh
dHVyZXM9NDYxMTY4NzEyMjI0NjUzMzE1NikgYXQNCi4uL2h3L25ldC92aXJ0aW8tbmV0LmM6MTAw
NA0KIzIwIDB4MDAwMDU1ZDk0MjMzZDI0OCBpbiB2aXJ0aW9fc2V0X2ZlYXR1cmVzX25vY2hlY2sN
Cih2ZGV2PXZkZXZAZW50cnk9MHg1NWQ5NDU0ZTg1MzAsDQp2YWw9dmFsQGVudHJ5PTQ2MTE2ODcx
MjIyNDY1MzMxNTYpIGF0IC4uL2h3L3ZpcnRpby92aXJ0aW8uYzoyODUxDQojMjEgMHgwMDAwNTVk
OTQyMzQyZWFlIGluIHZpcnRpb19sb2FkICh2ZGV2PTB4NTVkOTQ1NGU4NTMwLA0KZj0weDU1ZDk0
NDcwMGRlMCwgdmVyc2lvbl9pZD0xMSkgYXQgLi4vaHcvdmlydGlvL3ZpcnRpby5jOjMwMjcNCiMy
MiAweDAwMDA1NWQ5NDIyMDc2MDEgaW4gdm1zdGF0ZV9sb2FkX3N0YXRlIChmPWZAZW50cnk9MHg1
NWQ5NDQ3MDBkZTAsDQp2bXNkPTB4NTVkOTQyOWJhYmEwICwgb3BhcXVlPTB4NTVkOTQ1NGU4NTMw
LCB2ZXJzaW9uX2lkPTExKSBhdA0KLi4vbWlncmF0aW9uL3Ztc3RhdGUuYzoxMzcNCiMyMyAweDAw
MDA1NWQ5NDIyMjI2NzIgaW4gdm1zdGF0ZV9sb2FkIChmPTB4NTVkOTQ0NzAwZGUwLA0Kc2U9MHg1
NWQ5NDU2MWI3MDApIGF0IC4uL21pZ3JhdGlvbi9zYXZldm0uYzo5MTkNCiMyNCAweDAwMDA1NWQ5
NDIyMjI5MjcgaW4gcWVtdV9sb2Fkdm1fc2VjdGlvbl9zdGFydF9mdWxsDQooZj1mQGVudHJ5PTB4
NTVkOTQ0NzAwZGUwLA0KbWlzPTB4NTVkOTQ0NGMyM2UwKSBhdCAuLi9taWdyYXRpb24vc2F2ZXZt
LmM6MjUwMw0KIzI1IDB4MDAwMDU1ZDk0MjIyNWNjOCBpbiBxZW11X2xvYWR2bV9zdGF0ZV9tYWlu
IChmPWZAZW50cnk9MHg1NWQ5NDQ3MDBkZTAsDQptaXM9bWlzQGVudHJ5PTB4NTVkOTQ0NGMyM2Uw
KSBhdCAuLi9taWdyYXRpb24vc2F2ZXZtLmM6MjcyOQ0KIzI2IDB4MDAwMDU1ZDk0MjIyNzE5NSBp
biBxZW11X2xvYWR2bV9zdGF0ZSAoZj0weDU1ZDk0NDcwMGRlMCkgYXQNCi4uL21pZ3JhdGlvbi9z
YXZldm0uYzoyODE2DQojMjcgMHgwMDAwNTVkOTQyMjE0ODBlIGluIHByb2Nlc3NfaW5jb21pbmdf
bWlncmF0aW9uX2NvIChvcGFxdWU9KSBhdA0KLi4vbWlncmF0aW9uL21pZ3JhdGlvbi5jOjYwNg0K
IzI4IDB4MDAwMDU1ZDk0MjU3ZDJhYiBpbiBjb3JvdXRpbmVfdHJhbXBvbGluZSAoaTA9LCBpMT0p
IGF0DQouLi91dGlsL2Nvcm91dGluZS11Y29udGV4dC5jOjE3Nw0KIzI5IDB4MDAwMDdmM2FmNjRk
MmM4MCBpbiBfX2NvcnJlY3RseV9ncm91cGVkX3ByZWZpeHdjIChiZWdpbj0weDIgLA0KZW5kPTB4
MCwgdGhvdXNhbmRzPTAgTCdcMDAwJywgZ3JvdXBpbmc9MHg3ZjNhZjY0YmQ4ZWIgPF9fR0lfcmFp
c2UrMjY3Pg0KIkhcMjEzXDIxNCRcYlwwMDEiKSBhdCBncm91cGluZy5jOjE3MQ0KIzMwIDB4MDAw
MDAwMDAwMDAwMDAwMCBpbiA/PyAoKQ0KDQoNCkl0IHNlZW1zIHRoYXQgd2hlbiBhZGRyZXNzX3Nw
YWNlX3RvX2ZsYXR2aWV3KCkgaXMgY2FsbGVkLCB0aGVyZSBpcyBtcg0KdHJhbnNhY3Rpb24NCmlu
IHByb2dyZXNzLCBhbmQgdGhlIHJjdSByZWFkIGxvY2sgaXMgbm90IGhlbGQuDQoNCkkgbmVlZCB0
byBmdXJ0aGVyIGNvbnNpZGVyIHRoZSBjb25kaXRpb25zIGZvciBzYW5pdHkgY2hlY2sgb3Igd2hl
dGhlciB3ZQ0KY2FuIGhvbGQgdGhlDQpyY3UgcmVhZCBsb2NrIGJlZm9yZSBhZGRyZXNzX3NwYWNl
X2luaXQoKSB0byBzb2x2ZSB0aGUgcHJvYmxlbS4NCg0KDQpFcnJvciAyOg0KDQpFUlJPUjouLi90
ZXN0cy9xdGVzdC9taWdyYXRpb24taGVscGVycy5jOjIwNTp3YWl0X2Zvcl9taWdyYXRpb25fc3Rh
dHVzOg0KYXNzZXJ0aW9uIGZhaWxlZDogKGdfdGVzdF90aW1lcl9lbGFwc2VkKCkgPCBNSUdSQVRJ
T05fU1RBVFVTX1dBSVRfVElNRU9VVCkNCkVSUk9SDQoxODAvMTgwIHFlbXU6cXRlc3QrcXRlc3Qt
eDg2XzY0IC8gcXRlc3QteDg2XzY0L21pZ3JhdGlvbi10ZXN0IEVSUk9SIDE0Ni4zMnMNCmtpbGxl
ZCBieSBzaWduYWwgNiBTSUdBQlJUDQo+Pj4gUVRFU1RfUUVNVV9CSU5BUlk9Li9xZW11LXN5c3Rl
bS14ODZfNjQgTUFMTE9DX1BFUlRVUkJfPTI1MA0KR19URVNUX0RCVVNfREFFTU9OPS9kYXRhMDAv
bWlncmF0aW9uL3FlbXUtb3Blbi90ZXN0cy9kYnVzLXZtc3RhdGUtZGFlbW9uLnNoDQovZGF0YTAw
L21pZ3JhdGlvbi9xZW11LW9wZW4vYnVpbGQvdGVzdHMvcXRlc3QvbWlncmF0aW9uLXRlc3QgLS10
YXAgLWsNCuKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAlQ0K4pyADQrigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJUNCg0KcWVtdS1zeXN0ZW0teDg2XzY0OiAuLi9zb2Z0bW11L21lbW9yeS5j
OjEwOTQ6DQptZW1vcnlfcmVnaW9uX3RyYW5zYWN0aW9uX2NvbW1pdDogQXNzZXJ0aW9uIGBxZW11
X211dGV4X2lvdGhyZWFkX2xvY2tlZCgpJw0KZmFpbGVkLg0KKioNCkVSUk9SOi4uL3Rlc3RzL3F0
ZXN0L21pZ3JhdGlvbi1oZWxwZXJzLmM6MjA1OndhaXRfZm9yX21pZ3JhdGlvbl9zdGF0dXM6DQph
c3NlcnRpb24gZmFpbGVkOiAoZ190ZXN0X3RpbWVyX2VsYXBzZWQoKSA8IE1JR1JBVElPTl9TVEFU
VVNfV0FJVF9USU1FT1VUKQ0KLi4vdGVzdHMvcXRlc3QvbGlicXRlc3QuYzoxOTA6IGtpbGxfcWVt
dSgpIGRldGVjdGVkIFFFTVUgZGVhdGggZnJvbSBzaWduYWwNCjYgKEFib3J0ZWQpIChjb3JlIGR1
bXBlZCkNCg0KKHRlc3QgcHJvZ3JhbSBleGl0ZWQgd2l0aCBzdGF0dXMgY29kZSAtNikNCg0KQ29y
ZWR1bXAgYmFja3RyYWNlOg0KIzAgX19HSV9yYWlzZSAoc2lnPXNpZ0BlbnRyeT02KSBhdCAuLi9z
eXNkZXBzL3VuaXgvc3lzdi9saW51eC9yYWlzZS5jOjUwDQojMSAweDAwMDA3ZmVkNWMxNGQ1MzUg
aW4gX19HSV9hYm9ydCAoKSBhdCBhYm9ydC5jOjc5DQojMiAweDAwMDA3ZmVkNWMxNGQ0MGYgaW4g
X19hc3NlcnRfZmFpbF9iYXNlIChmbXQ9MHg3ZmVkNWMyYWVlZjAgIiVzJXMlczoldToNCiVzJXNB
c3NlcnRpb24gYCVzJyBmYWlsZWQuXG4lbiIsIGFzc2VydGlvbj0weDU2MWJjNDE1MjQyNA0KInFl
bXVfbXV0ZXhfaW90aHJlYWRfbG9ja2VkKCkiLCBmaWxlPTB4NTYxYmM0MWFlOTRiICIuLi9zb2Z0
bW11L21lbW9yeS5jIiwNCmxpbmU9MTA5NCwgZnVuY3Rpb249KSBhdCBhc3NlcnQuYzo5Mg0KIzMg
MHgwMDAwN2ZlZDVjMTViMWEyIGluIF9fR0lfX19hc3NlcnRfZmFpbA0KKGFzc2VydGlvbj1hc3Nl
cnRpb25AZW50cnk9MHg1NjFiYzQxNTI0MjQNCiJxZW11X211dGV4X2lvdGhyZWFkX2xvY2tlZCgp
IiwgZmlsZT1maWxlQGVudHJ5PTB4NTYxYmM0MWFlOTRiDQoiLi4vc29mdG1tdS9tZW1vcnkuYyIs
IGxpbmU9bGluZUBlbnRyeT0xMDk0LA0KZnVuY3Rpb249ZnVuY3Rpb25AZW50cnk9MHg1NjFiYzQx
YWZjYTAgPF9fUFJFVFRZX0ZVTkNUSU9OX18uMzg3NDY+DQoibWVtb3J5X3JlZ2lvbl90cmFuc2Fj
dGlvbl9jb21taXQiKSBhdCBhc3NlcnQuYzoxMDENCiM0IDB4MDAwMDU2MWJjM2U1YTA1MyBpbiBt
ZW1vcnlfcmVnaW9uX3RyYW5zYWN0aW9uX2NvbW1pdCAoKSBhdA0KLi4vc29mdG1tdS9tZW1vcnku
YzoxMDk0DQojNSAweDAwMDA1NjFiYzNkMDdiNTUgaW4gcWVtdV9sb2Fkdm1fc3RhdGVfbWFpbiAo
Zj1mQGVudHJ5PTB4NTYxYmM2NDQzYWEwLA0KbWlzPW1pc0BlbnRyeT0weDU2MWJjNjIwMjhhMCkg
YXQgLi4vbWlncmF0aW9uL3NhdmV2bS5jOjI3ODkNCiM2IDB4MDAwMDU2MWJjM2QwOGU0NiBpbiBw
b3N0Y29weV9yYW1fbGlzdGVuX3RocmVhZA0KKG9wYXF1ZT1vcGFxdWVAZW50cnk9MHg1NjFiYzYy
MDI4YTApDQphdCAuLi9taWdyYXRpb24vc2F2ZXZtLmM6MTkyMg0KIzcgMHgwMDAwNTYxYmM0MDRi
M2RhIGluIHFlbXVfdGhyZWFkX3N0YXJ0IChhcmdzPSkgYXQNCi4uL3V0aWwvcWVtdS10aHJlYWQt
cG9zaXguYzo1MDUNCiM4IDB4MDAwMDdmZWQ1YzJmMmZhMyBpbiBzdGFydF90aHJlYWQgKGFyZz0p
IGF0IHB0aHJlYWRfY3JlYXRlLmM6NDg2DQojOSAweDAwMDA3ZmVkNWMyMjQwNmYgaW4gY2xvbmUg
KCkgYXQNCi4uL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L3g4Nl82NC9jbG9uZS5TOjk1DQoNCg0K
RXJyb3IyIGlzIHJlbGF0ZWQgdG8gcG9zdGNvcHkuIEkgZG9uJ3Qga25vdyBtdWNoIGFib3V0IHRo
ZSBjb2RlIG9mDQpwb3N0Y29weS4NClNvIEkgbmVlZCBzb21lIHRpbWUgdG8gbG9vayBhdCB0aGlz
IHBhcnQgb2YgY29kZS4NCg0KQW5kIGxhdGVyIEkgd2lsbCBzZW5kIGFub3RoZXIgZW1haWwgdG8g
ZGlzY3VzcyBpdCB3aXRoIFBldGVyLg0KDQpDb3B5IFBldGVyLg0KDQpUaGFua3MhDQo=
--000000000000a6a16105f4d307e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi, Juan
<br>
<br>Thanks for your test results!
<br>
<br>On 2023/2/16 =E4=B8=8A=E5=8D=883:10, Juan Quintela wrote:
<br>&gt; Chuang Xu  wrote:
<br>&gt;&gt; In this version:
<br>&gt; Hi
<br>&gt;
<br>&gt; I had to drop this.  It breaks migration of dbus-vmstate.
<br>
<br>Previously, I only focused on the precopy migration test
<br>in the normal scenario, but did not run qtest. So I need to
<br>apologize for my inexperience..
<br>
<br>&gt;
<br>&gt; .[K144/179 qemu:qtest+qtest-x86_64 / qtest-x86_64/virtio-net-failo=
ver             ERROR           5.66s   killed by signal 6 SIGABRT
<br>&gt;&gt;&gt;&gt; G_TEST_DBUS_DAEMON=3D/mnt/code/qemu/multifd/tests/dbus=
-vmstate-daemon.sh QTEST_QEMU_BINARY=3D./qemu-system-x86_64 MALLOC_PERTURB_=
=3D145 /scratch/qemu/multifd/x64/tests/qtest/virtio-net-failover --tap -k
<br>&gt; =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80  =E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
<br>&gt; stderr:
<br>&gt; qemu-system-x86_64: /mnt/code/qemu/multifd/include/exec/memory.h:1=
112: address_space_to_flatview: Assertion `(!memory_region_transaction_in_p=
rogress() &amp;&amp; qemu_mutex_iothread_locked()) || rcu_read_is_locked()&=
#39; failed.
<br>&gt; Broken pipe
<br>&gt; ../../../../mnt/code/qemu/multifd/tests/qtest/libqtest.c:190: kill=
_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
<br>&gt;
<br>&gt; (test program exited with status code -6)
<br>&gt;
<br>&gt; TAP parsing error: Too few tests run (expected 23, got 12)
<br>&gt; =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95
<br>&gt;
<br>&gt; Can you take a look at this?
<br>&gt;
<br>&gt; I reproduced it with &quot;make check&quot; and qemu compiled with=
 the configure
<br>&gt; line attached.
<br>&gt;
<br>&gt; Later, Juan.
<br>&gt;
<br>&gt; configure --enable-trace-backends=3Dlog
<br>&gt; 	--prefix=3D/usr
<br>&gt; 	--sysconfdir=3D/etc/sysconfig/
<br>&gt; 	--audio-drv-list=3Dpa
<br>&gt; 	--target-list=3Dx86_64-softmmu
<br>&gt; 	--with-coroutine=3Ducontext
<br>&gt; 	--with-git-submodules=3Dvalidate
<br>&gt; 	--enable-fdt=3Dsystem
<br>&gt; 	--enable-alsa
<br>&gt; 	--enable-attr
<br>&gt; 	--enable-auth-pam
<br>&gt; 	--enable-avx2
<br>&gt; 	--enable-avx512f
<br>&gt; 	--enable-bochs
<br>&gt; 	--enable-bpf
<br>&gt; 	--enable-brlapi
<br>&gt; 	--disable-bsd-user
<br>&gt; 	--enable-bzip2
<br>&gt; 	--enable-cap-ng
<br>&gt; 	--disable-capstone
<br>&gt; 	--disable-cfi
<br>&gt; 	--disable-cfi-debug
<br>&gt; 	--enable-cloop
<br>&gt; 	--disable-cocoa
<br>&gt; 	--enable-containers
<br>&gt; 	--disable-coreaudio
<br>&gt; 	--enable-coroutine-pool
<br>&gt; 	--enable-crypto-afalg
<br>&gt; 	--enable-curl
<br>&gt; 	--enable-curses
<br>&gt; 	--enable-dbus-display
<br>&gt; 	--enable-debug-info
<br>&gt; 	--disable-debug-mutex
<br>&gt; 	--disable-debug-stack-usage
<br>&gt; 	--disable-debug-tcg
<br>&gt; 	--enable-dmg
<br>&gt; 	--disable-docs
<br>&gt; 	--disable-dsound
<br>&gt; 	--enable-fdt
<br>&gt; 	--disable-fuse
<br>&gt; 	--disable-fuse-lseek
<br>&gt; 	--disable-fuzzing
<br>&gt; 	--disable-gcov
<br>&gt; 	--enable-gettext
<br>&gt; 	--enable-gio
<br>&gt; 	--enable-glusterfs
<br>&gt; 	--enable-gnutls
<br>&gt; 	--disable-gprof
<br>&gt; 	--enable-gtk
<br>&gt; 	--disable-guest-agent
<br>&gt; 	--disable-guest-agent-msi
<br>&gt; 	--disable-hax
<br>&gt; 	--disable-hvf
<br>&gt; 	--enable-iconv
<br>&gt; 	--enable-install-blobs
<br>&gt; 	--enable-jack
<br>&gt; 	--enable-keyring
<br>&gt; 	--enable-kvm
<br>&gt; 	--enable-l2tpv3
<br>&gt; 	--enable-libdaxctl
<br>&gt; 	--enable-libiscsi
<br>&gt; 	--enable-libnfs
<br>&gt; 	--enable-libpmem
<br>&gt; 	--enable-libssh
<br>&gt; 	--enable-libudev
<br>&gt; 	--enable-libusb
<br>&gt; 	--enable-linux-aio
<br>&gt; 	--enable-linux-io-uring
<br>&gt; 	--disable-linux-user
<br>&gt; 	--enable-live-block-migration
<br>&gt; 	--disable-lto
<br>&gt; 	--disable-lzfse
<br>&gt; 	--enable-lzo
<br>&gt; 	--disable-malloc-trim
<br>&gt; 	--enable-membarrier
<br>&gt; 	--enable-module-upgrades
<br>&gt; 	--enable-modules
<br>&gt; 	--enable-mpath
<br>&gt; 	--enable-multiprocess
<br>&gt; 	--disable-netmap
<br>&gt; 	--enable-nettle
<br>&gt; 	--enable-numa
<br>&gt; 	--disable-nvmm
<br>&gt; 	--enable-opengl
<br>&gt; 	--enable-oss
<br>&gt; 	--enable-pa
<br>&gt; 	--enable-parallels
<br>&gt; 	--enable-pie
<br>&gt; 	--enable-plugins
<br>&gt; 	--enable-png
<br>&gt; 	--disable-profiler
<br>&gt; 	--enable-pvrdma
<br>&gt; 	--enable-qcow1
<br>&gt; 	--enable-qed
<br>&gt; 	--disable-qom-cast-debug
<br>&gt; 	--enable-rbd
<br>&gt; 	--enable-rdma
<br>&gt; 	--enable-replication
<br>&gt; 	--enable-rng-none
<br>&gt; 	--disable-safe-stack
<br>&gt; 	--disable-sanitizers
<br>&gt; 	--enable-stack-protector
<br>&gt; 	--enable-sdl
<br>&gt; 	--enable-sdl-image
<br>&gt; 	--enable-seccomp
<br>&gt; 	--enable-selinux
<br>&gt; 	--enable-slirp
<br>&gt; 	--enable-slirp-smbd
<br>&gt; 	--enable-smartcard
<br>&gt; 	--enable-snappy
<br>&gt; 	--enable-sparse
<br>&gt; 	--enable-spice
<br>&gt; 	--enable-spice-protocol
<br>&gt; 	--enable-system
<br>&gt; 	--enable-tcg
<br>&gt; 	--disable-tcg-interpreter
<br>&gt; 	--disable-tools
<br>&gt; 	--enable-tpm
<br>&gt; 	--disable-tsan
<br>&gt; 	--disable-u2f
<br>&gt; 	--enable-usb-redir
<br>&gt; 	--disable-user
<br>&gt; 	--disable-vde
<br>&gt; 	--enable-vdi
<br>&gt; 	--enable-vhost-crypto
<br>&gt; 	--enable-vhost-kernel
<br>&gt; 	--enable-vhost-net
<br>&gt; 	--enable-vhost-user
<br>&gt; 	--enable-vhost-user-blk-server
<br>&gt; 	--enable-vhost-vdpa
<br>&gt; 	--enable-virglrenderer
<br>&gt; 	--enable-virtfs
<br>&gt; 	--enable-virtiofsd
<br>&gt; 	--enable-vnc
<br>&gt; 	--enable-vnc-jpeg
<br>&gt; 	--enable-vnc-sasl
<br>&gt; 	--enable-vte
<br>&gt; 	--enable-vvfat
<br>&gt; 	--enable-werror
<br>&gt; 	--disable-whpx
<br>&gt; 	--enable-xen
<br>&gt; 	--enable-xen-pci-passthrough
<br>&gt; 	--enable-xkbcommon
<br>&gt; 	--enable-zstd
<br>&gt; 	--disable-gcrypt
<br>
<br>I ran qtest with reference to your environment, and finally reported tw=
o errors.
<br>
<br>Error 1(the same as yours):
<br>
<br>  QTEST_QEMU_BINARY=3D./qemu-system-x86_64 MALLOC_PERTURB_=3D87 G_TEST_=
DBUS_DAEMON=3D/data00/migration/qemu-open/tests/dbus-vmstate-daemon.sh /dat=
a00/migration/qemu-open/build/tests/qtest/virtio-net-failover --tap -k
<br>=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95 =E2=9C=80  =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95
<br>stderr:
<br>qemu-system-x86_64: /data00/migration/qemu-open/include/exec/memory.h:1=
114: address_space_to_flatview: Assertion `(!memory_region_transaction_in_p=
rogress() &amp;&amp; qemu_mutex_iothread_locked()) || rcu_read_is_locked()&=
#39; failed.
<br>Broken pipe
<br>../tests/qtest/libqtest.c:190: kill_qemu() detected QEMU death from sig=
nal 6 (Aborted) (core dumped)
<br>
<br>(test program exited with status code -6)
<br>
<br>TAP parsing error: Too few tests run (expected 23, got 12)
<br>
<br>Coredump backtrace:
<br>#0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/rais=
e.c:50
<br>#1  0x00007f3af64a8535 in __GI_abort () at abort.c:79
<br>#2  0x00007f3af64a840f in __assert_fail_base (fmt=3D0x7f3af6609ef0 &quo=
t;%s%s%s:%u: %s%sAssertion `%s&#39; failed.\n%n&quot;, assertion=3D0x55d942=
5f48a8 &quot;(!memory_region_transaction_in_progress() &amp;&amp; qemu_mute=
x_iothread_locked()) || rcu_read_is_locked()&quot;,
<br>     file=3D0x55d9425f4870 &quot;/data00/migration/qemu-open/include/ex=
ec/memory.h&quot;, line=3D1114, function=3D) at assert.c:92
<br>#3  0x00007f3af64b61a2 in __GI___assert_fail (assertion=3Dassertion@ent=
ry=3D0x55d9425f48a8 &quot;(!memory_region_transaction_in_progress() &amp;&a=
mp; qemu_mutex_iothread_locked()) || rcu_read_is_locked()&quot;,
<br>     file=3Dfile@entry=3D0x55d9425f4870 &quot;/data00/migration/qemu-op=
en/include/exec/memory.h&quot;, line=3Dline@entry=3D1114, function=3Dfuncti=
on@entry=3D0x55d9426cdce0 &lt;__PRETTY_FUNCTION__.20039&gt; &quot;address_s=
pace_to_flatview&quot;) at assert.c:101
<br>#4  0x000055d942373853 in address_space_to_flatview (as=3D0x55d94473864=
8) at /data00/migration/qemu-open/include/exec/memory.h:1112
<br>#5  0x000055d9423746f5 in address_space_to_flatview (as=3D0x55d94473864=
8) at /data00/migration/qemu-open/include/qemu/rcu.h:126
<br>#6  address_space_set_flatview (as=3Das@entry=3D0x55d944738648) at ../s=
oftmmu/memory.c:1029
<br>#7  0x000055d94237ace3 in address_space_update_topology (as=3D0x55d9447=
38648) at ../softmmu/memory.c:1080
<br>#8  address_space_init (as=3Das@entry=3D0x55d944738648, root=3Droot@ent=
ry=3D0x55d9447386a0, name=3Dname@entry=3D0x55d9447384f0 &quot;virtio-net-pc=
i&quot;) at ../softmmu/memory.c:3082
<br>#9  0x000055d942151e43 in do_pci_register_device (errp=3D0x7f3aef7fe850=
, devfn=3D, name=3D0x55d9444b6c40 &quot;virtio-net-pci&quot;, pci_dev=3D0x5=
5d944738410) at ../hw/pci/pci.c:1145
<br>#10 pci_qdev_realize (qdev=3D0x55d944738410, errp=3D0x7f3aef7fe850) at =
../hw/pci/pci.c:2036
<br>#11 0x000055d942404a8f in device_set_realized (obj=3D, value=3Dtrue, er=
rp=3D0x7f3aef7feae0) at ../hw/core/qdev.c:510
<br>#12 0x000055d942407e36 in property_set_bool (obj=3D0x55d944738410, v=3D=
, name=3D, opaque=3D0x55d9444c71d0, errp=3D0x7f3aef7feae0) at ../qom/object=
.c:2285
<br>#13 0x000055d94240a0e3 in object_property_set (obj=3Dobj@entry=3D0x55d9=
44738410, name=3Dname@entry=3D0x55d942670c23 &quot;realized&quot;, v=3Dv@en=
try=3D0x55d9452f7a00, errp=3Derrp@entry=3D0x7f3aef7feae0) at ../qom/object.=
c:1420
<br>#14 0x000055d94240d15f in object_property_set_qobject (obj=3Dobj@entry=
=3D0x55d944738410, name=3Dname@entry=3D0x55d942670c23 &quot;realized&quot;,=
 value=3Dvalue@entry=3D0x55d945306cb0, errp=3Derrp@entry=3D0x7f3aef7feae0) =
at ../qom/qom-qobject.c:28
<br>#15 0x000055d94240a354 in object_property_set_bool (obj=3D0x55d94473841=
0, name=3Dname@entry=3D0x55d942670c23 &quot;realized&quot;, value=3Dvalue@e=
ntry=3Dtrue, errp=3Derrp@entry=3D0x7f3aef7feae0) at ../qom/object.c:1489
<br>#16 0x000055d94240427c in qdev_realize (dev=3D, bus=3Dbus@entry=3D0x55d=
945141400, errp=3Derrp@entry=3D0x7f3aef7feae0) at ../hw/core/qdev.c:292
<br>#17 0x000055d9421ef4a0 in qdev_device_add_from_qdict (opts=3D0x55d94530=
9c00, from_json=3D, errp=3D, errp@entry=3D0x7f3aef7feae0) at /data00/migrat=
ion/qemu-open/include/hw/qdev-core.h:17
<br>#18 0x000055d942311c85 in failover_add_primary (errp=3D0x7f3aef7fead8, =
n=3D0x55d9454e8530) at ../hw/net/virtio-net.c:933
<br>#19 virtio_net_set_features (vdev=3D, features=3D4611687122246533156) a=
t ../hw/net/virtio-net.c:1004
<br>#20 0x000055d94233d248 in virtio_set_features_nocheck (vdev=3Dvdev@entr=
y=3D0x55d9454e8530, val=3Dval@entry=3D4611687122246533156) at ../hw/virtio/=
virtio.c:2851
<br>#21 0x000055d942342eae in virtio_load (vdev=3D0x55d9454e8530, f=3D0x55d=
944700de0, version_id=3D11) at ../hw/virtio/virtio.c:3027
<br>#22 0x000055d942207601 in vmstate_load_state (f=3Df@entry=3D0x55d944700=
de0, vmsd=3D0x55d9429baba0 , opaque=3D0x55d9454e8530, version_id=3D11) at .=
./migration/vmstate.c:137
<br>#23 0x000055d942222672 in vmstate_load (f=3D0x55d944700de0, se=3D0x55d9=
4561b700) at ../migration/savevm.c:919
<br>#24 0x000055d942222927 in qemu_loadvm_section_start_full (f=3Df@entry=
=3D0x55d944700de0, mis=3D0x55d9444c23e0) at ../migration/savevm.c:2503
<br>#25 0x000055d942225cc8 in qemu_loadvm_state_main (f=3Df@entry=3D0x55d94=
4700de0, mis=3Dmis@entry=3D0x55d9444c23e0) at ../migration/savevm.c:2729
<br>#26 0x000055d942227195 in qemu_loadvm_state (f=3D0x55d944700de0) at ../=
migration/savevm.c:2816
<br>#27 0x000055d94221480e in process_incoming_migration_co (opaque=3D) at =
../migration/migration.c:606
<br>#28 0x000055d94257d2ab in coroutine_trampoline (i0=3D, i1=3D) at ../uti=
l/coroutine-ucontext.c:177
<br>#29 0x00007f3af64d2c80 in __correctly_grouped_prefixwc (begin=3D0x2 , e=
nd=3D0x0, thousands=3D0 L&#39;\000&#39;, grouping=3D0x7f3af64bd8eb &lt;__GI=
_raise+267&gt; &quot;H\213\214$\b\001&quot;) at grouping.c:171
<br>#30 0x0000000000000000 in ?? ()
<br>
<br>
<br>It seems that when address_space_to_flatview() is called, there is mr t=
ransaction
<br>in progress, and the rcu read lock is not held.
<br>
<br>I need to further consider the conditions for sanity check or whether w=
e can hold the
<br>rcu read lock before address_space_init() to solve the problem.
<br>
<br>
<br>Error 2:
<br>
<br>ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migration_status:=
 assertion failed: (g_test_timer_elapsed() &lt; MIGRATION_STATUS_WAIT_TIMEO=
UT) ERROR
<br>180/180 qemu:qtest+qtest-x86_64 / qtest-x86_64/migration-test          =
        ERROR          146.32s   killed by signal 6 SIGABRT
<br>&gt;&gt;&gt; QTEST_QEMU_BINARY=3D./qemu-system-x86_64 MALLOC_PERTURB_=
=3D250 G_TEST_DBUS_DAEMON=3D/data00/migration/qemu-open/tests/dbus-vmstate-=
daemon.sh /data00/migration/qemu-open/build/tests/qtest/migration-test --ta=
p -k
<br>=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95 =E2=9C=80  =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95
<br>qemu-system-x86_64: ../softmmu/memory.c:1094: memory_region_transaction=
_commit: Assertion `qemu_mutex_iothread_locked()&#39; failed.
<br>**
<br>ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migration_status:=
 assertion failed: (g_test_timer_elapsed() &lt; MIGRATION_STATUS_WAIT_TIMEO=
UT)
<br>../tests/qtest/libqtest.c:190: kill_qemu() detected QEMU death from sig=
nal 6 (Aborted) (core dumped)
<br>
<br>(test program exited with status code -6)
<br>
<br>Coredump backtrace:
<br>#0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/rais=
e.c:50
<br>#1  0x00007fed5c14d535 in __GI_abort () at abort.c:79
<br>#2  0x00007fed5c14d40f in __assert_fail_base (fmt=3D0x7fed5c2aeef0 &quo=
t;%s%s%s:%u: %s%sAssertion `%s&#39; failed.\n%n&quot;, assertion=3D0x561bc4=
152424 &quot;qemu_mutex_iothread_locked()&quot;, file=3D0x561bc41ae94b &quo=
t;../softmmu/memory.c&quot;, line=3D1094, function=3D) at assert.c:92
<br>#3  0x00007fed5c15b1a2 in __GI___assert_fail (assertion=3Dassertion@ent=
ry=3D0x561bc4152424 &quot;qemu_mutex_iothread_locked()&quot;, file=3Dfile@e=
ntry=3D0x561bc41ae94b &quot;../softmmu/memory.c&quot;, line=3Dline@entry=3D=
1094,
<br>     function=3Dfunction@entry=3D0x561bc41afca0 &lt;__PRETTY_FUNCTION__=
.38746&gt; &quot;memory_region_transaction_commit&quot;) at assert.c:101
<br>#4  0x0000561bc3e5a053 in memory_region_transaction_commit () at ../sof=
tmmu/memory.c:1094
<br>#5  0x0000561bc3d07b55 in qemu_loadvm_state_main (f=3Df@entry=3D0x561bc=
6443aa0, mis=3Dmis@entry=3D0x561bc62028a0) at ../migration/savevm.c:2789
<br>#6  0x0000561bc3d08e46 in postcopy_ram_listen_thread (opaque=3Dopaque@e=
ntry=3D0x561bc62028a0) at ../migration/savevm.c:1922
<br>#7  0x0000561bc404b3da in qemu_thread_start (args=3D) at ../util/qemu-t=
hread-posix.c:505
<br>#8  0x00007fed5c2f2fa3 in start_thread (arg=3D) at pthread_create.c:486
<br>#9  0x00007fed5c22406f in clone () at ../sysdeps/unix/sysv/linux/x86_64=
/clone.S:95
<br>
<br>
<br>Error2 is related to postcopy. I don&#39;t know much about the code of =
postcopy.
<br>So I need some time to look at this part of code.
<br>
<br>And later I will send another email to discuss it with Peter.
<br>
<br>Copy Peter.
<br>
<br>Thanks!</p>

--000000000000a6a16105f4d307e0--

