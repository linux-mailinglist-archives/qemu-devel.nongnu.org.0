Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C13E611A87
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 20:54:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooUUK-00077L-Tr; Fri, 28 Oct 2022 14:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1ooUUI-000779-TW; Fri, 28 Oct 2022 14:53:50 -0400
Received: from [200.168.210.66] (helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1ooUUG-0007EM-DS; Fri, 28 Oct 2022 14:53:50 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 28 Oct 2022 15:53:43 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 3CA14800094;
 Fri, 28 Oct 2022 15:53:43 -0300 (-03)
Message-ID: <98409771-02f6-746b-1c06-c2ecf2400ceb@eldorado.org.br>
Date: Fri, 28 Oct 2022 15:53:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] target/ppc: Fix regression in Radix MMU
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Cc: danielhb413@gmail.com, clg@kaod.org, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20221028183617.121786-1-leandro.lupori@eldorado.org.br>
Content-Language: en-US
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <20221028183617.121786-1-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 28 Oct 2022 18:53:43.0769 (UTC)
 FILETIME=[9A3CAC90:01D8EAFE]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

T24gMjgvMTAvMjAyMiAxNTozNiwgTGVhbmRybyBMdXBvcmkgd3JvdGU6DQo+IENvbW1pdCA0
N2U4M2Q5MTA3IGVuZGVkIHVwIHVuaW50ZW50aW9uYWxseSBjaGFuZ2luZyB0aGUgY29udHJv
bCBmbG93DQo+IG9mIHBwY19yYWRpeDY0X3Byb2Nlc3Nfc2NvcGVkX3hsYXRlKCkuIFdoZW4g
Z3Vlc3RfdmlzaWJsZSBpcyBmYWxzZSwNCj4gaXQgbXVzdCBub3QgcmFpc2UgYW4gZXhjZXB0
aW9uLCBldmVuIGlmIHRoZSByYWRpeCBjb25maWd1cmF0aW9uIGlzDQo+IG5vdCB2YWxpZC4N
Cj4gDQo+IFRoaXMgcmVncmVzc2lvbiBwcmV2ZW50ZWQgTGludXggYm9vdCBpbiBhIG5lc3Rl
ZCBlbnZpcm9ubWVudCB3aXRoDQo+IEwxIHVzaW5nIFRDRyBhbmQgZW11bGF0aW5nIEtWTSAo
Y2FwLW5lc3RlZC1odj1vbikgYW5kIEwyIHVzaW5nDQo+IEtWTS4gTDIgd291bGQgaGFuZyBv
biBMaW51eCdzIGZ1dGV4X2luaXQoKSwgd2hlbiBpdCB0ZXN0ZWQgaG93IGENCj4gZnV0ZXhf
YXRvbWljX2NtcHhjaGdfaW5hdG9taWMoKSBoYW5kbGVkIGEgZmF1bHQsIGJlY2F1c2UgTDEg
d291bGQNCj4gc3RhcnQgYSBsb29wIG9mIHRyeWluZyB0byBwZXJmb3JtIHBhcnRpdGlvbiBz
Y29wZWQgdHJhbnNsYXRpb25zDQo+IGFuZCByYWlzaW5nIGV4Y2VwdGlvbnMuDQo+IA0KPiBG
aXhlczogNDdlODNkOTEwNyAoInRhcmdldC9wcGM6IEltcHJvdmUgUmFkaXggeGxhdGUgbGV2
ZWwgdmFsaWRhdGlvbiIpDQo+IFJlcG9ydGVkLWJ5OiBWaWN0b3IgQ29sb21ibyA8dmljdG9y
LmNvbG9tYm9AZWxkb3JhZG8ub3JnLmJyPg0KPiBTaWduZWQtb2ZmLWJ5OiBMZWFuZHJvIEx1
cG9yaSA8bGVhbmRyby5sdXBvcmlAZWxkb3JhZG8ub3JnLmJyPg0KDQpJdCBub3cgcmVhY2hl
cyB0aGUgbG9naW4gc2NyZWVuIG9uIEwyDQoNClRlc3RlZC1ieTogVsOtY3RvciBDb2xvbWJv
IDx2aWN0b3IuY29sb21ib0BlbGRvcmFkby5vcmcuYnI+DQoNCi0tIA0KVsOtY3RvciBDb3Jh
IENvbG9tYm8NCkluc3RpdHV0byBkZSBQZXNxdWlzYXMgRUxET1JBRE8NCkF2aXNvIExlZ2Fs
IC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIu
aHRtbD4NCg0K

