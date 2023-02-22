Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F4B69F892
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 17:03:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUrZj-0002aA-Ng; Wed, 22 Feb 2023 11:02:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUrZi-0002Zz-2h
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:02:34 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUrZf-0001C0-VL
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:02:33 -0500
Received: by mail-wr1-x429.google.com with SMTP id r7so8103688wrz.6
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 08:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nz0psJFvoFZHNq+EQw0oj5T/jhrF18jCLHbRpER4emU=;
 b=VENH8nPgdgOVPv3zvKeWXNcR51wIL67aAjpAIx8zmGjI3VzZFJoBFjoTx6UwlFmBe1
 epckiOLwm00hW46noBdAx5LooKsuzKEHVfkr+oU4mLjn7VaOLnrzkNaq8eSHUyLY5PZu
 3SejGvjVZy1lzKJZIbvD6TJDYuf3uK0orDi1b7Abzg2tcOPUoAs2NLQU61XZgpaMxE2a
 YIbx0pawQ3nQCo8ZIR4vrlji+R52ji999DD9UVi5F4JkhGRqu6+hDmQx+Q+X5h/+Jxc/
 NheYlgK8GmdO654iSMWAwi88KAg6Rd9GrW9Sh51L/kUHpL+TEfTsLHNHfRG1EHPnZOh1
 mIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nz0psJFvoFZHNq+EQw0oj5T/jhrF18jCLHbRpER4emU=;
 b=WBmmunu/Wji5yNOcQzKNDAW7NuELl/a8nypdaCXf5vOf7qHxCaIfg7XdVPqiQUcTIy
 rDp2ee/suFYD+XC74xf7W6oCfHIusmgxc91MQoPf+Od1yiR7KzxXILzyTGJA36/14sXH
 AaYXENv6AlbnGpviVAuagFCdBPLHd/FD0qHWkFTTpTZ9ibwSZKig2ktImRv4yzJmjkly
 R3gdrOCKWSPp0JeO7IVKd4QRwNCuC7ldvsecIHvLXvwElWysXF1NepTxehiobJjfLMTJ
 mqXh8rwfPoP7KXt5AYgVANbNe6gigcsxNMd5HqIouZmJiM+llgPEvujSPpbw8D0zPVD1
 x4fA==
X-Gm-Message-State: AO0yUKXa68B3UgaUCaqbYy23GFO6RIluma63r+G+zX2pZgGrTxV3vmmy
 KWYG1x4MdZldduS4VkKl09VdIw==
X-Google-Smtp-Source: AK7set/s3dlHGcVhtgRiaMPXg5upaA1dY3acZcgqofvoD/gzATrwbTCgj4bKYxmSF+Ov/XkcF8rvuQ==
X-Received: by 2002:a05:6000:12d2:b0:2c5:60e6:eac with SMTP id
 l18-20020a05600012d200b002c560e60eacmr7202428wrx.24.1677081749049; 
 Wed, 22 Feb 2023 08:02:29 -0800 (PST)
Received: from ?IPV6:2a01:cb16:203d:61c1:1d6f:c826:249a:2f22?
 ([2a01:cb16:203d:61c1:1d6f:c826:249a:2f22])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a5d6b4d000000b002c6e8af1037sm10695378wrw.104.2023.02.22.08.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 08:02:28 -0800 (PST)
Message-ID: <8e364c5b-dcb9-40fa-c3ff-79eda7198488@linaro.org>
Date: Wed, 22 Feb 2023 17:02:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 4/4] target/ppc: fix warning with clang-15
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 alex.bennee@linaro.org, peter.maydell@linaro.org
References: <20230221153006.20300-1-pierrick.bouvier@linaro.org>
 <20230221153006.20300-5-pierrick.bouvier@linaro.org>
 <7ddd5f42-8536-47a5-5e4b-096221460f2f@linaro.org>
 <88715435-b0b9-c75c-327c-7441a1fba3fb@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <88715435-b0b9-c75c-327c-7441a1fba3fb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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

T24gMi8yMi8yMyAwMDo0MywgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDIvMjEv
MjMgMTI6MzAsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPj4gT24gMjEvMi8y
MyAxNjozMCwgUGllcnJpY2sgQm91dmllciB3cm90ZToNCj4+PiBXaGVuIGNvbXBpbGluZyBm
b3Igd2luZG93cy1hcm02NCB1c2luZyBjbGFuZy0xNSwgaXQgcmVwb3J0cyBhIHNvbWV0aW1l
cw0KPj4+IHVuaW5pdGlhbGl6ZWQgdmFyaWFibGUuIFRoaXMgc2VlbXMgdG8gYmUgYSBmYWxz
ZSBwb3NpdGl2ZSwgYXMgYSBkZWZhdWx0DQo+Pj4gY2FzZSBndWFyZHMgc3dpdGNoIGV4cHJl
c3Npb25zLCBwcmV2ZW50aW5nIHRvIHJldHVybiBhbiB1bmluaXRpYWxpemVkDQo+Pj4gdmFs
dWUsIGJ1dCBjbGFuZyBzZWVtcyB1bmhhcHB5IHdpdGggYXNzZXJ0KDApIGRlZmluaXRpb24u
DQo+Pg0KPj4gJCBnaXQgZ3JlcCAnYXNzZXJ0KDApJyB8IHdjIC1sDQo+PiAgIMKgwqDCoMKg
wqAgOTYNCj4+DQo+PiBTaG91bGQgd2UgbWFzcy11cGRhdGUgYW5kIGZvcmJpZCAnYXNzZXJ0
KDApJyBhZGRpbmcgYSBjaGVjayBpbg0KPj4gc2NyaXB0cy9jaGVja3BhdGNoLnBsPyBPdGhl
cndpc2Ugd2UnbGwga2VlcCBnZXR0aW5nIHNpbWlsYXIgY2xhbmcNCj4+IHdhcm5pbmdzLi4u
DQo+IA0KPiBJIGp1c3QgdGhpbmsgYXNzZXJ0KDApIHByb2R1Y2VzIGEgbGVzcyBjbGVhbiBl
cnJvciBtZXNzYWdlLCBzbyBvbiB0aGF0IGJhc2lzIHllcywgd2UNCj4gc2hvdWxkIHJlcGxh
Y2UgdGhlbSBhbGwuICBQZXJoYXBzIGFib3J0KCkgYXMgd2VsbCwgdW5sZXNzIHRoZXJlJ3Mg
YW4gZXJyb3JfcmVwb3J0DQo+IGltbWVkaWF0ZWx5IHByZWNlZGluZy4NCj4gDQoNCklmIHdl
IHN0YXJ0IGV4cGxvcmluZyB0aGlzIHdheSwgd2h5IG5vdCBkZWZpbmUgZXhwbGljaXQgbm9y
ZXR1cm4gDQpmdW5jdGlvbnMgZm9yIHRoaXM6IHVucmVhY2hhYmxlKCkgYW5kIHRvZG8oKS91
bmltcGxlbWVudGVkKCkuIE5hbWVzIGFyZSANCmluc3BpcmVkIGZyb20gdGhlIHNhbWUgUnVz
dCBtYWNyb3MgWzFdLiBJTUhPLCBhbGwgYXNzZXJ0KDApIGZhbGwgaW50byANCm9uZSBvZiB0
aG9zZSB0d28gY2F0ZWdvcmllcy4gSXQncyBlYXN5IHRvIGdyZXAsIGFuZCBleHBsaWNpdC4N
Cg0KVGhlIGFkdmFudGFnZSwgYmVzaWRlcyBjbGFyaXR5LCB3b3VsZCBiZSB0byBndWFyYW50
ZWUgaXQgaXMgbmV2ZXIgDQpyZW1vdmVkLiBJIG5vdGljZWQgcWVtdSBjYW4ndCBiZSBjb21w
aWxlZCB3aXRoIE5ERUJVRyBmb3Igbm93LCBidXQgd2l0aCANCnRoaXMsIGl0IHdvdWxkIHJl
bW92ZSBhbGwgYXNzZXJ0IGludm9jYXRpb25zLCBpbmNsdWRpbmcgYXNzZXJ0KDApLg0KDQpb
MV0gaHR0cHM6Ly9kb2MucnVzdC1sYW5nLm9yZy9zdGQvaW5kZXguaHRtbCNtYWNyb3MNCg0K
PiBUaGUgZmFjdCB0aGF0IGFzc2VydCgwKSB3YXMgc2VlbiB0byBmYWxsIHRocm91Z2ggaXMg
YSBzeXN0ZW0gaGVhZGVyIGJ1Zy4gIEkgc2VlIHdlIGhhdmUgYQ0KPiB3b3JrYXJvdW5kIGlu
IGluY2x1ZGUvcWVtdS9vc2RlcC5oIGZvciBfX01JTkdXMzJfXywgYnV0IEkgZ3Vlc3MgdGhp
cyBkb2Vzbid0IHRyaWdnZXIgZm9yDQo+IGFybTY0PyAgUGllcnJpY2ssIHdvdWxkIHlvdSBt
aW5kIHRlc3RpbmcgYSBjaGFuZ2UgdGhlcmU/DQo+IA0KDQpJIGNhbiBjb25maXJtIHRoaXMg
d29ya2Fyb3VuZCBpcyBlbmFibGVkIGZvciB3aW5kb3dzLWFybTY0Lg0KDQpJbmRlZWQsIGZy
b20gbXN5czIgY2xhbmdhcm02NCBlbnY6DQokIGVjaG8gfCBjYyAtZE0gLUUgLSB8IGdyZXAg
TUlOR1cNCiNkZWZpbmUgX19NSU5HVzMyX18gMQ0KI2RlZmluZSBfX01JTkdXNjRfXyAxDQok
IGNjIC0tdmVyc2lvbg0KY2xhbmcgdmVyc2lvbiAxNS4wLjcNClRhcmdldDogYWFyY2g2NC13
NjQtd2luZG93cy1nbnUNCg0KSW4gbW9yZSwgaXQgaXMgbmVlZGVkLiBXaXRob3V0IHRoZSB3
b3JrYXJvdW5kIGluIG9zZGVwLmgsIGNvbXBpbGF0aW9uIA0KZmFpbHMgd2l0aCB0aGlzIG1l
c3NhZ2U6DQoNCnFlbXUvaW5jbHVkZS9leGVjL2V4ZWMtYWxsLmg6NjE5OjU6IGVycm9yOiBj
YWxsIHRvIA0KcWVtdV9idWlsZF9ub3RfcmVhY2hlZF9hbHdheXMgZGVjbGFyZWQgd2l0aCAn
ZXJyb3InIGF0dHJpYnV0ZTogY29kZSBwYXRoIA0KaXMgcmVhY2hhYmxlDQogICAgIHFlbXVf
YnVpbGRfbm90X3JlYWNoZWQoKTsNCiAgICAgXg0KcWVtdS9pbmNsdWRlL3FlbXUvb3NkZXAu
aDoyNDI6MzU6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8gDQoncWVtdV9idWlsZF9ub3Rf
cmVhY2hlZCcNCiNkZWZpbmUgcWVtdV9idWlsZF9ub3RfcmVhY2hlZCgpICBxZW11X2J1aWxk
X25vdF9yZWFjaGVkX2Fsd2F5cygpDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF4NCjEgZXJyb3IgZ2VuZXJhdGVkLg0KDQo+IA0KPiByfg0K

