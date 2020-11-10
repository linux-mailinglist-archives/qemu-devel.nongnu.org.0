Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E302ADCDE
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 18:28:10 +0100 (CET)
Received: from localhost ([::1]:60626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcXRB-0005uM-HQ
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 12:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kcXPh-0005SN-V1
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:26:38 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:45127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kcXPf-0006Pa-EK
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:26:37 -0500
Received: by mail-pl1-x641.google.com with SMTP id z1so6800021plo.12
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 09:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HYnnNC4DeETPpRHC5BbBkrPzkJ4rfWInp5NP2ds2jZg=;
 b=s/2y54xZWxuIJ7rQAeOvTPVIn+xlRB259kuehDpoQdZdZkkRK/rBC8tmP6l01OO3ma
 i0cT5GxYZZoPNU93yPen/IVVp9QuZjssVT0pjtBH2hrBwJVTf4qqdSFTVgP3LrEtLpZf
 g6Ss0xq+GysUdTijkwQoKb0Xb/MzPJt1jQbTNXSSUTuBnbut7Yac75c21Te82MWLmDjd
 JqtH8G7RJLGgja5OfsdzRF2X8yDnVYrdg4Ojnl6f6bXkDGUJryiWfcjCpUNRnkXUuMxA
 yPGQuiqY5kPKOzEkOqhGO9Q9duYF9uttiXqRUmaOOPtICsBzmbqFnOhIHXZpRTStIUou
 wltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HYnnNC4DeETPpRHC5BbBkrPzkJ4rfWInp5NP2ds2jZg=;
 b=WfK2h1WJPFjuUrpkQogbSm7rj/wMPv0tfAa3aEkdUa3Tz80R24ib53M0kDulKq6MnD
 5FZ2WvMRUd1P3yUjeNk4R9x3PhnZRSLhoDtwzdOuyByHLsYJOFFzy8pv+bMkNAQL+Kxa
 2bwZb71QGLrFobQQ6hVfDEe85cd4jYe6EZbADpMb6MrG4rOrLajGKZcUdbP6dao6LZ7r
 w7N+hgC7Tz5xuSSeYczNh2qO+tut9ta2vsZhE03cg5l//1hJt0gRI05UIceBLom0SVPf
 t6keTXIbxUOyglD5AeaV/4y9G0FB2f7KuVRQmaFUQA3Bt5Vi7HFlcwu/5SnPpgxi2pBa
 NQ6A==
X-Gm-Message-State: AOAM531QAaxt/u8gpV/hMhls31NUH6JhNC25KbYe/7JgA1MnDyyYxtFC
 ejGcwuMc3pxy+mheH0pEilISnm66zlpsfg==
X-Google-Smtp-Source: ABdhPJxXWAWL+lZBgMbrknQ06EoUTFJtQA+jMDoogk77kZOWBXycYUTL2TVg+preGenRufeEvQDTxg==
X-Received: by 2002:a17:902:bc81:b029:d6:ed57:b7c7 with SMTP id
 bb1-20020a170902bc81b02900d6ed57b7c7mr16821495plb.1.1605029190029; 
 Tue, 10 Nov 2020 09:26:30 -0800 (PST)
Received: from [192.168.3.43] (068-185-011-182.biz.spectrum.com.
 [68.185.11.182])
 by smtp.gmail.com with ESMTPSA id v23sm14616757pfn.141.2020.11.10.09.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 09:26:28 -0800 (PST)
Subject: Re: [PATCH v3 15/41] accel/tcg: Support split-wx for linux with memfd
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20201106032921.600200-1-richard.henderson@linaro.org>
 <20201106032921.600200-16-richard.henderson@linaro.org>
 <875z6d87ql.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7c06f1ee-6b86-9e4e-2b09-b4e2d27f1e47@linaro.org>
Date: Tue, 10 Nov 2020 09:26:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <875z6d87ql.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: j@getutm.app, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMTEvMTAvMjAgOTowMyBBTSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiANCj4gUmljaGFy
ZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+IHdyaXRlczoNCj4g
DQo+PiBXZSBjYW5ub3QgdXNlIGEgcmVhbCB0ZW1wIGZpbGUsIGJlY2F1c2Ugd2Ugd291bGQg
bmVlZCB0byBmaW5kDQo+PiBhIGZpbGVzeXN0ZW0gdGhhdCBkb2VzIG5vdCBoYXZlIG5vZXhl
YyBlbmFibGVkLiAgSG93ZXZlciwgYQ0KPj4gbWVtZmQgaXMgbm90IGFzc29jaWF0ZWQgd2l0
aCBhbnkgZmlsZXN5c3RlbS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEhlbmRl
cnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4gDQo+IEl0IGxvb2tzIGxp
a2UgdGhpcyBicmVha3MgLS1lbmFibGUtdGNnLWludGVycHJldGVyOg0KPiANCj4gICBGQUlM
RUQ6IGxpYnFlbXUtcHBjNjQtc29mdG1tdS5mYS5wL2FjY2VsX3RjZ190cmFuc2xhdGUtYWxs
LmMubw0KPiAgIGNjIC1JbGlicWVtdS1wcGM2NC1zb2Z0bW11LmZhLnAgLUkuIC1JLi4vLi4g
LUl0YXJnZXQvcHBjIC1JLi4vLi4vdGFyZ2V0L3BwYyAtSS4uLy4uL2R0Yy9saWJmZHQgLUku
Li8uLi9jYXBzdG9uZS9pbmNsdWRlL2NhcHN0b25lIC1JcWFwaSAtSXRyYWNlIC1JdWkgLUl1
aS9zaGFkZXIgLUkvdXNyL2luY2x1ZGUvc3BpY2Utc2VydmVyIC1JL3Vzci9pbmNsdWRlL3Nw
aWNlLTEgLUkvdXNyL2luY2x1ZGUvcGl4bWFuLTEgLUkvdXNyL2luY2x1ZGUvbGliZHJtIC1J
L3Vzci9pbmNsdWRlL2dsaWItMi4wIC1JL3Vzci9saWIveDg2XzY0LWxpbnV4LWdudS9nbGli
LTIuMC9pbmNsdWRlIC1mZGlhZ25vc3RpY3MtY29sb3I9YXV0byAtcGlwZSAtV2FsbCAtV2lu
dmFsaWQtcGNoIC1XZXJyb3IgLXN0ZD1nbnU5OSAtTzIgLWcgLVVfRk9SVElGWV9TT1VSQ0Ug
LURfRk9SVElGWV9TT1VSQ0U9MiAtbTY0IC1tY3gxNiAtRF9HTlVfU09VUkNFIC1EX0ZJTEVf
T0ZGU0VUX0JJVFM9NjQgLURfTEFSR0VGSUxFX1NPVVJDRSAtV3N0cmljdC1wcm90b3R5cGVz
IC1XcmVkdW5kYW50LWRlY2xzIC1XdW5kZWYgLVd3cml0ZS1zdHJpbmdzIC1XbWlzc2luZy1w
cm90b3R5cGVzIC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1mbm8tY29tbW9uIC1md3JhcHYgLVdv
bGQtc3R5bGUtZGVjbGFyYXRpb24gLVdvbGQtc3R5bGUtZGVmaW5pdGlvbiAtV3R5cGUtbGlt
aXRzIC1XZm9ybWF0LXNlY3VyaXR5IC1XZm9ybWF0LXkyayAtV2luaXQtc2VsZiAtV2lnbm9y
ZWQtcXVhbGlmaWVycyAtV2VtcHR5LWJvZHkgLVduZXN0ZWQtZXh0ZXJucyAtV2VuZGlmLWxh
YmVscyAtV2V4cGFuc2lvbi10by1kZWZpbmVkIC1Xbm8tbWlzc2luZy1pbmNsdWRlLWRpcnMg
LVduby1zaGlmdC1uZWdhdGl2ZS12YWx1ZSAtV25vLXBzYWJpIC1mc3RhY2stcHJvdGVjdG9y
LXN0cm9uZyAtRExFR0FDWV9SRE1BX1JFR19NUiAtaXN5c3RlbSAvaG9tZS9hbGV4L2xzcmMv
cWVtdS5naXQvbGludXgtaGVhZGVycyAtaXN5c3RlbSBsaW51eC1oZWFkZXJzIC1pcXVvdGUg
L2hvbWUvYWxleC9sc3JjL3FlbXUuZ2l0L3RjZy90Y2kgLWlxdW90ZSAuIC1pcXVvdGUgL2hv
bWUvYWxleC9sc3JjL3FlbXUuZ2l0IC1pcXVvdGUgL2hvbWUvYWxleC9sc3JjL3FlbXUuZ2l0
L2FjY2VsL3RjZyAtaXF1b3RlIC9ob21lL2FsZXgvbHNyYy9xZW11LmdpdC9pbmNsdWRlIC1p
cXVvdGUgL2hvbWUvYWxleC9sc3JjL3FlbXUuZ2l0L2Rpc2FzL2xpYnZpeGwgLXB0aHJlYWQg
LWZQSUMgLWlzeXN0ZW0uLi8uLi9saW51eC1oZWFkZXJzIC1pc3lzdGVtbGludXgtaGVhZGVy
cyAtRE5FRURfQ1BVX0ggJy1EQ09ORklHX1RBUkdFVD0icHBjNjQtc29mdG1tdS1jb25maWct
dGFyZ2V0LmgiJyAnLURDT05GSUdfREVWSUNFUz0icHBjNjQtc29mdG1tdS1jb25maWctZGV2
aWNlcy5oIicgLU1EIC1NUSBsaWJxZW11LXBwYzY0LXNvZnRtbXUuZmEucC9hY2NlbF90Y2df
dHJhbnNsYXRlLWFsbC5jLm8gLU1GIGxpYnFlbXUtcHBjNjQtc29mdG1tdS5mYS5wL2FjY2Vs
X3RjZ190cmFuc2xhdGUtYWxsLmMuby5kIC1vIGxpYnFlbXUtcHBjNjQtc29mdG1tdS5mYS5w
L2FjY2VsX3RjZ190cmFuc2xhdGUtYWxsLmMubyAtYyAuLi8uLi9hY2NlbC90Y2cvdHJhbnNs
YXRlLWFsbC5jDQo+ICAgLi4vLi4vYWNjZWwvdGNnL3RyYW5zbGF0ZS1hbGwuYzoxMTM4OjEz
OiBlcnJvcjog4oCYYWxsb2NfY29kZV9nZW5fYnVmZmVyX3NwbGl0d3hfbWVtZmTigJkgZGVm
aW5lZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWZ1bmN0aW9uXQ0KPiAgICBzdGF0
aWMgYm9vbCBhbGxvY19jb2RlX2dlbl9idWZmZXJfc3BsaXR3eF9tZW1mZChzaXplX3Qgc2l6
ZSwgRXJyb3IgKiplcnJwKQ0KPiAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fg0KPiAgIGNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQg
YXMgZXJyb3JzDQoNCkJhaCwgdGhpcyB3aWxsIGFjdHVhbGx5IGJlIHBhdGNoIDM5LCB3aGVy
ZSBJIHN3aXRjaCBmcm9tIGlmIHRvIGlmZGVmLiAgSSdsbA0KaGF2ZSB0byByZWFycmFuZ2Ug
dGhvc2UuDQoNCg0Kcn4NCg==

