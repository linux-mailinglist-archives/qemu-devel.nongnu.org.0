Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70A92AF077
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:25:01 +0100 (CET)
Received: from localhost ([::1]:44202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcpBN-0005A7-1U
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcp47-0000X9-Mr
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:17:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcp3t-0000ec-Bm
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:17:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605097035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yL5OomwZjSaM0wsAc5WeuJjg7bKZVzd6xKKyxGMGCX8=;
 b=UMptk7i5frUOr5r1pAl+qcByT5lQwc2WNMRRUAqaGPoIv29HX3MkZiDCAQ9UMYnlL9NmMe
 7LsEsJsVEn5uNAjgFdbU5GZ4Cd0+L/INIoUfFIFwvi1Ef0DraEWedw8Wkz5WFSwPd6JlX0
 V7Z8dlgpyyRq266ahwzt9jMLfdg36Co=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-Ql2FYCZ4N2KSmKNhWfzlwA-1; Wed, 11 Nov 2020 07:17:12 -0500
X-MC-Unique: Ql2FYCZ4N2KSmKNhWfzlwA-1
Received: by mail-wm1-f71.google.com with SMTP id y26so695503wmj.7
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 04:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3N7aZczImXPu8A5qAEXQ5mIlgVnKXwqgoYmTPEmP4Dg=;
 b=f+JVSH5ivxozCz9fPvG5PciSuBJlo9vq2u1QShkK5tOpI1IB00VUTzQ29He/glMyW4
 /JafxwVNs+6ax//Pgmsw3yhZI8ht1dPlzkLLd30NXwHdD1KQhihU05e8nwKq4GqlYwft
 NmgtRnrHy7nFbSxwPiX3D2T1dR5Ysu4hjiw79u9PfHNj5VOf06MeA06mgUNGubnUpu5w
 Gr30bvcQi5Ee6MsNi4xzW6eTaTjfGQWUjuzpDlCy/WigNhJ8pQRSDihtFWhmT5ElCmKn
 GWG0yGDwUJ7fJJSmssZOfw/7oqCWIeKuMr6QKeHYmde4GIoD8KkND4TRKPfN6NR7yMWH
 i73A==
X-Gm-Message-State: AOAM532uq+C8ibWWWpf0VUhQgnMf303bec4K0WMvLMVLoJMuSPs2yWgt
 OCqbSfhsI7Nf5C85Ga+OQ38IYnBjsflooyNA9piEuJgaF7DRYgar4afGFPG6YOYmt8pQB1VGD2T
 FzX87y1laf+pyKQ0=
X-Received: by 2002:a1c:7303:: with SMTP id d3mr4067670wmb.152.1605097030950; 
 Wed, 11 Nov 2020 04:17:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPH095VkUW0FAL9lShB/Z0dihy2zU1MVdM5vSznff0VyJBWG5K3Fr2ECkAebZQBo0oyghyow==
X-Received: by 2002:a1c:7303:: with SMTP id d3mr4067649wmb.152.1605097030773; 
 Wed, 11 Nov 2020 04:17:10 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id c17sm2296567wro.19.2020.11.11.04.17.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 04:17:10 -0800 (PST)
Subject: Re: [PATCH] dev-uas: Fix a error of variable sized type not at end
To: Han Han <hhan@redhat.com>, qemu-devel@nongnu.org
References: <20201111064737.576673-1-hhan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ccdf2399-f5ab-ac05-92ec-f5acd318e0f2@redhat.com>
Date: Wed, 11 Nov 2020 13:17:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111064737.576673-1-hhan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, laurent@vivier.eu,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgSGFuLA0KDQpPbiAxMS8xMS8yMCA3OjQ3IEFNLCBIYW4gSGFuIHdyb3RlOg0KPiBGaXggdGhl
IGZvbGxvd2luZyBlcnJvciB3aGVuIGNvbXBpbGluZzoNCj4gDQo+IEZBSUxFRDogbGliY29tbW9u
LmZhLnAvaHdfdXNiX2Rldi11YXMuYy5vDQo+IGNsYW5nIC1JbGliY29tbW9uLmZhLnAgLUkuIC1J
Li4gLUlxYXBpIC1JdHJhY2UgLUl1aSAtSXVpL3NoYWRlciAtSS91c3IvaW5jbHVkZS9saWJ1c2It
MS4wIC1JL3Vzci9pbmNsdWRlL3NwaWNlLTEgLUkvdXNyL2luY2x1ZGUvc3BpY2Utc2VydmVyIC1J
L3Vzci9pbmNsdWRlL2NhY2FyZCAtSS91c3IvaW5jbHVkZS9nbGliLTIuMCAtSS91c3IvbGliNjQv
Z2xpYi0yLjAvaW5jbHVkZSAtSS91c3IvaW5jbHVkZS9uc3MzIC1JL3Vzci9pbmNsdWRlL25zcHI0
IC1JL3Vzci9pbmNsdWRlL2xpYm1vdW50IC1JL3Vzci9pbmNsdWRlL2Jsa2lkIC1JL3Vzci9pbmNs
dWRlL3BpeG1hbi0xIC1JL3Vzci9pbmNsdWRlL3Z0ZS0yLjkxIC1JL3Vzci9pbmNsdWRlL3Bhbmdv
LTEuMCAtSS91c3IvaW5jbHVkZS9oYXJmYnV6eiAtSS91c3IvaW5jbHVkZS9mcmVldHlwZTIgLUkv
dXNyL2luY2x1ZGUvbGlicG5nMTYgLUkvdXNyL2luY2x1ZGUvZnJpYmlkaSAtSS91c3IvaW5jbHVk
ZS9saWJ4bWwyIC1JL3Vzci9pbmNsdWRlL2NhaXJvIC1JL3Vzci9pbmNsdWRlL2d0ay0zLjAgLUkv
dXNyL2luY2x1ZGUvZ2RrLXBpeGJ1Zi0yLjAgLUkvdXNyL2luY2x1ZGUvZ2lvLXVuaXgtMi4wIC1J
L3Vzci9pbmNsdWRlL2F0ay0xLjAgLUkvdXNyL2luY2x1ZGUvYXQtc3BpMi1hdGsvMi4wIC1JL3Vz
ci9pbmNsdWRlL2RidXMtMS4wIC1JL3Vzci9saWI2NC9kYnVzLTEuMC9pbmNsdWRlIC1JL3Vzci9p
bmNsdWRlL2F0LXNwaS0yLjAgLUkvdXNyL2luY2x1ZGUvU0RMMiAtSS91c3IvaW5jbHVkZS9zbGly
cCAtSS91c3IvaW5jbHVkZS92aXJnbCAtSS91c3IvaW5jbHVkZS9jYXBzdG9uZSAtWGNsYW5nIC1m
Y29sb3ItZGlhZ25vc3RpY3MgLXBpcGUgLVdhbGwgLVdpbnZhbGlkLXBjaCAtV2Vycm9yIC1zdGQ9
Z251OTkgLU8yIC1nIC1mc2FuaXRpemU9dW5kZWZpbmVkIC1mc2FuaXRpemU9YWRkcmVzcyAtbTY0
IC1tY3gxNiAtRF9HTlVfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLURfTEFSR0VGSUxF
X1NPVVJDRSAtV3N0cmljdC1wcm90b3R5cGVzIC1XcmVkdW5kYW50LWRlY2xzIC1XdW5kZWYgLVd3
cml0ZS1zdHJpbmdzIC1XbWlzc2luZy1wcm90b3R5cGVzIC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1m
bm8tY29tbW9uIC1md3JhcHYgLVdvbGQtc3R5bGUtZGVmaW5pdGlvbiAtV3R5cGUtbGltaXRzIC1X
Zm9ybWF0LXNlY3VyaXR5IC1XZm9ybWF0LXkyayAtV2luaXQtc2VsZiAtV2lnbm9yZWQtcXVhbGlm
aWVycyAtV2VtcHR5LWJvZHkgLVduZXN0ZWQtZXh0ZXJucyAtV2VuZGlmLWxhYmVscyAtV2V4cGFu
c2lvbi10by1kZWZpbmVkIC1Xbm8taW5pdGlhbGl6ZXItb3ZlcnJpZGVzIC1Xbm8tbWlzc2luZy1p
bmNsdWRlLWRpcnMgLVduby1zaGlmdC1uZWdhdGl2ZS12YWx1ZSAtV25vLXN0cmluZy1wbHVzLWlu
dCAtV25vLXR5cGVkZWYtcmVkZWZpbml0aW9uIC1Xbm8tdGF1dG9sb2dpY2FsLXR5cGUtbGltaXQt
Y29tcGFyZSAtV25vLXBzYWJpIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAtZnNhbml0aXplPWZ1
enplci1uby1saW5rIC1pc3lzdGVtIC9ob21lL2hoYW4vU29mdHdhcmUvcWVtdS9saW51eC1oZWFk
ZXJzIC1pc3lzdGVtIGxpbnV4LWhlYWRlcnMgLWlxdW90ZSAvaG9tZS9oaGFuL1NvZnR3YXJlL3Fl
bXUvdGNnL2kzODYgLWlxdW90ZSAuIC1pcXVvdGUgL2hvbWUvaGhhbi9Tb2Z0d2FyZS9xZW11IC1p
cXVvdGUgL2hvbWUvaGhhbi9Tb2Z0d2FyZS9xZW11L2FjY2VsL3RjZyAtaXF1b3RlIC9ob21lL2ho
YW4vU29mdHdhcmUvcWVtdS9pbmNsdWRlIC1pcXVvdGUgL2hvbWUvaGhhbi9Tb2Z0d2FyZS9xZW11
L2Rpc2FzL2xpYnZpeGwgLXB0aHJlYWQgLWZQSUMgLURTVFJVQ1RfSU9WRUNfREVGSU5FRCAtRF9S
RUVOVFJBTlQgLVduby11bmRlZiAtRF9ERUZBVUxUX1NPVVJDRSAtRF9YT1BFTl9TT1VSQ0U9NjAw
IC1ETkNVUlNFU19XSURFQ0hBUiAtTUQgLU1RIGxpYmNvbW1vbi5mYS5wL2h3X3VzYl9kZXYtdWFz
LmMubyAtTUYgbGliY29tbW9uLmZhLnAvaHdfdXNiX2Rldi11YXMuYy5vLmQgLW8gbGliY29tbW9u
LmZhLnAvaHdfdXNiX2Rldi11YXMuYy5vIC1jIC4uL2h3L3VzYi9kZXYtdWFzLmMNCj4gLi4vaHcv
dXNiL2Rldi11YXMuYzoxNTg6MzE6IGVycm9yOiBmaWVsZCAnc3RhdHVzJyB3aXRoIHZhcmlhYmxl
IHNpemVkIHR5cGUgJ3Vhc19pdScgbm90IGF0IHRoZSBlbmQgb2YgYSBzdHJ1Y3Qgb3IgY2xhc3Mg
aXMgYSBHTlUgZXh0ZW5zaW9uIFstV2Vycm9yLC1XZ251LXZhcmlhYmxlLXNpemVkLXR5cGUtbm90
LWF0LWVuZF0NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhhbiBIYW4gPGhoYW5AcmVkaGF0LmNvbT4N
Cj4gLS0tDQo+ICBody91c2IvZGV2LXVhcy5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaHcvdXNiL2Rl
di11YXMuYyBiL2h3L3VzYi9kZXYtdWFzLmMNCj4gaW5kZXggY2VjMDcxZDk2Yy4uNWVmM2Y0ZmVj
OSAxMDA2NDQNCj4gLS0tIGEvaHcvdXNiL2Rldi11YXMuYw0KPiArKysgYi9ody91c2IvZGV2LXVh
cy5jDQo+IEBAIC0xNTQsOSArMTU0LDkgQEAgc3RydWN0IFVBU1JlcXVlc3Qgew0KPiAgDQo+ICBz
dHJ1Y3QgVUFTU3RhdHVzIHsNCj4gICAgICB1aW50MzJfdCAgICAgICAgICAgICAgICAgIHN0cmVh
bTsNCj4gLSAgICB1YXNfaXUgICAgICAgICAgICAgICAgICAgIHN0YXR1czsNCj4gICAgICB1aW50
MzJfdCAgICAgICAgICAgICAgICAgIGxlbmd0aDsNCj4gICAgICBRVEFJTFFfRU5UUlkoVUFTU3Rh
dHVzKSAgIG5leHQ7DQo+ICsgICAgdWFzX2l1ICAgICAgICAgICAgICAgICAgICBzdGF0dXM7DQo+
ICB9Ow0KPiAgDQo+ICAvKiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gKi8NCj4gDQoNCkRhbmllbGUgYWxyZWFkeSBz
ZW50IGEgcGF0Y2ggZm9yIHRoaXMgaXNzdWU6DQpodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29t
L3FlbXUtZGV2ZWxAbm9uZ251Lm9yZy9tc2c3NTc5NDAuaHRtbA0K


