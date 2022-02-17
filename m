Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CBB4BA0DE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 14:19:05 +0100 (CET)
Received: from localhost ([::1]:44302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKggZ-00041S-W7
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 08:19:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nKgCO-0007mU-6Z; Thu, 17 Feb 2022 07:47:54 -0500
Received: from [187.72.171.209] (port=34490 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nKgCK-0001Sp-3m; Thu, 17 Feb 2022 07:47:50 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 17 Feb 2022 09:46:22 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id B4A338001F1;
 Thu, 17 Feb 2022 09:46:21 -0300 (-03)
Message-ID: <5c23b766-e436-b1cb-2f54-d2b1ef71e540@eldorado.org.br>
Date: Thu, 17 Feb 2022 09:46:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 11/11] tests/tcg: add vectorised sha512 versions
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220211160309.335014-1-alex.bennee@linaro.org>
 <20220211160309.335014-12-alex.bennee@linaro.org>
 <f8164a77-80d1-86fa-7fc9-6089d6b4f34b@eldorado.org.br>
 <87v8xhcwdf.fsf@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <87v8xhcwdf.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 17 Feb 2022 12:46:22.0255 (UTC)
 FILETIME=[5DF5CBF0:01D823FC]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 f4bug@amsat.org, Eduardo Habkost <eduardo@habkost.net>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMTQvMDIvMjAyMiAxMjoxNCwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiAiTWF0aGV1cyBL
LiBGZXJzdCIgPG1hdGhldXMuZmVyc3RAZWxkb3JhZG8ub3JnLmJyPiB3cml0ZXM6DQo+IA0K
Pj4gT24gMTEvMDIvMjAyMiAxMzowMywgQWxleCBCZW5uw6llIHdyb3RlOg0KPj4+IFRoaXMg
YnVpbGRzIHZlY3RvcmlzZWQgdmVyc2lvbnMgb2Ygc2hhNTEyIHRvIGV4ZXJjaXNlIHRoZSB2
ZWN0b3IgY29kZToNCj4+PiAgICAgLSBhYXJjaDY0IChBZHZTaW1kKQ0KPj4+ICAgICAtIGkz
ODYgKFNTRSkNCj4+PiAgICAgLSBzMzkweCAoTVZYKQ0KPj4+ICAgICAtIHBwYzY0ICh2ZWN0
b3IpDQo+Pj4gU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5h
cm8ub3JnPg0KPj4+IFJldmlld2VkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5o
ZW5kZXJzb25AbGluYXJvLm9yZz4NCj4+PiBNZXNzYWdlLUlkOiA8MjAyMjAyMDIxOTEyNDIu
NjUyNjA3LTUtYWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4+PiAtLS0NCj4+PiB2Mg0KPj4+
ICAgICAtIHVzZSAtbXNzZTQuMSAtTzMgaW5zdGVhZCBvZiAtcGVudGl1bTQgZm9yIGkzODYg
YnVpbGQNCj4+PiAtLS0NCj4+PiAgICB0ZXN0cy90Y2cvbXVsdGlhcmNoL3NoYTUxMi5jICAg
ICAgfCAyICstDQo+Pj4gICAgdGVzdHMvdGNnL2FhcmNoNjQvTWFrZWZpbGUudGFyZ2V0IHwg
NyArKysrKysrDQo+Pj4gICAgdGVzdHMvdGNnL2FybS9NYWtlZmlsZS50YXJnZXQgICAgIHwg
OCArKysrKysrKw0KPj4+ICAgIHRlc3RzL3RjZy9pMzg2L01ha2VmaWxlLnRhcmdldCAgICB8
IDYgKysrKysrDQo+Pj4gICAgdGVzdHMvdGNnL3BwYzY0bGUvTWFrZWZpbGUudGFyZ2V0IHwg
NSArKysrLQ0KPj4+ICAgIHRlc3RzL3RjZy9zMzkweC9NYWtlZmlsZS50YXJnZXQgICB8IDkg
KysrKysrKysrDQo+Pj4gICAgdGVzdHMvdGNnL3g4Nl82NC9NYWtlZmlsZS50YXJnZXQgIHwg
NyArKysrKysrDQo+Pj4gICAgNyBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pg0KPj4gPHNuaXA+DQo+Pg0KPj4+IGRpZmYgLS1naXQg
YS90ZXN0cy90Y2cvcHBjNjRsZS9NYWtlZmlsZS50YXJnZXQgYi90ZXN0cy90Y2cvcHBjNjRs
ZS9NYWtlZmlsZS50YXJnZXQNCj4+PiBpbmRleCA0ODBmZjA4OThkLi40ZjFkMDNkZmNmIDEw
MDY0NA0KPj4+IC0tLSBhL3Rlc3RzL3RjZy9wcGM2NGxlL01ha2VmaWxlLnRhcmdldA0KPj4+
ICsrKyBiL3Rlc3RzL3RjZy9wcGM2NGxlL01ha2VmaWxlLnRhcmdldA0KPj4+IEBAIC01LDEw
ICs1LDEzIEBADQo+Pj4gICAgVlBBVEggKz0gJChTUkNfUEFUSCkvdGVzdHMvdGNnL3BwYzY0
bGUNCj4+PiAgICBpZm5lcSAoJChET0NLRVJfSU1BR0UpJChDUk9TU19DQ19IQVNfUE9XRVI4
X1ZFQ1RPUiksKQ0KPj4+IC1QUEM2NExFX1RFU1RTPWJjZHN1YiBub25fc2lnbmFsbGluZ194
c2N2DQo+Pj4gK1BQQzY0TEVfVEVTVFM9YmNkc3ViIG5vbl9zaWduYWxsaW5nX3hzY3Ygc2hh
NTEyLXZlY3Rvcg0KPj4+ICAgIGVuZGlmDQo+Pj4gICAgJChQUEM2NExFX1RFU1RTKTogQ0ZM
QUdTICs9IC1tcG93ZXI4LXZlY3Rvcg0KPj4+DQo+Pg0KPj4gU2luY2UgdGhpcyB0ZXN0IGRv
ZXMgbm90IHRhcmdldCBhIHNwZWNpZmljIGluc3RydWN0aW9uLCBtYXliZSBpdA0KPj4gc2hv
dWxkIHVzZSAtbXZzeC8tbWFsdGl2ZWMgdG8gYWxsb3cgdGhlIGNvbXBpbGVyIHRvIHVzZSBu
ZXdlcg0KPj4gaW5zdHJ1Y3Rpb25zLg0KPiANCj4gSSB3YXNuJ3Qgc3VyZSB3aGljaCB2ZWN0
b3IgaW5zdHJ1Y3Rpb25zIGFyZSBzdXBwb3J0ZWQgYnkgdGhlIFRDRyBmcm9udA0KPiBlbmRz
IHNvIGlmIHRoZSBhYm92ZSBmbGFncyB3b24ndCB0cmlwIHVwIHRoZSBUQ0cgSSBjYW4gYWRk
IHRoZW0gdG8gdGhlDQo+IGNmbGFncy4NCj4gDQoNCkFGQUlDVCwgd2Ugc2hvdWxkIGhhdmUg
YWxsIHZlY3RvciBpbnN0cnVjdGlvbiB1bnRpbCBQT1dFUjkuIFBPV0VSMTAgaXMgDQpXSVAs
IGJ1dCBjdXJyZW50IHZlcnNpb25zIG9mIEdDQy9DbGFuZyBhcmUgbm90IGVtaXR0aW5nIGFu
eSBvZiB0aGUgDQptaXNzaW5nIGluc3RydWN0aW9ucywgZXZlbiB3aXRoIC1tY3B1PXBvd2Vy
MTANCg0KVGhhbmtzLA0KTWF0aGV1cyBLLiBGZXJzdA0KSW5zdGl0dXRvIGRlIFBlc3F1aXNh
cyBFTERPUkFETyA8aHR0cDovL3d3dy5lbGRvcmFkby5vcmcuYnIvPg0KQW5hbGlzdGEgZGUg
U29mdHdhcmUNCkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3Jh
ZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4NCg==

