Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A563CD322
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 13:09:21 +0200 (CEST)
Received: from localhost ([::1]:53584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5R9E-0005le-84
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 07:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <denniswoelfing@gmx.de>)
 id 1m5R7v-0003xG-Ii
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:07:59 -0400
Received: from mout.gmx.net ([212.227.17.22]:36919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <denniswoelfing@gmx.de>)
 id 1m5R7s-00021H-RQ
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:07:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1626692872;
 bh=WWjtMZqDXpNvRuQdR9XGghTlFlNXm4S/LQ6MiHUlP5I=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
 b=bU6GZQXPf+Xo81/ZTpbLVmtCETVZIdR5U8UAFJSYohKP/roVL0yma63PXHQl2dQaM
 dBIABqb4q9OoZBfajp8rQRCDmiqWdsbtRJWIFPAbfDWZrpjZQX9P8I2L5WzjXhNrjy
 NJ36TbuWskFtb33q7T94FyJRQbneNZFrj8FfUhyU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.188.43] ([88.130.62.78]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVvLB-1ldckE2uEn-00Ru1s; Mon, 19
 Jul 2021 13:07:51 +0200
Subject: Re: [PATCH for 6.1] ui/gtk: Fix relative mouse with multiple monitors
From: =?UTF-8?Q?Dennis_W=c3=b6lfing?= <denniswoelfing@gmx.de>
To: qemu-devel@nongnu.org
References: <20210629132410.286813-1-denniswoelfing@gmx.de>
 <e8a8fece-0d18-d055-e637-fe988db854c5@gmx.de>
Message-ID: <23551a0c-03f5-aeb9-da64-04a3f51efb03@gmx.de>
Date: Mon, 19 Jul 2021 13:07:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <e8a8fece-0d18-d055-e637-fe988db854c5@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:Hy64faRZgi5yoNvTK7GvxprVo4L6EVGF6GzniLUj9r7qGbH736M
 E/MFqZth2K2KrOj1FWKkvrR1Gx7awl6VUfYCHO49u05Qs2iax+GT5RArxS9V/KHI6vE2UZ/
 s46y3FCdtpauQjGKxjuQ1qk6o9tQtBIzt16Vrn2Hc7dZ/P3csVmiGZQkRlyNsc3YQ66LRB6
 /j3CE96IfDbKDH7g3a9AA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jgzy1GL3iY8=:T1IXqKBg8VMzQbPLaM9erX
 AR5uEZ61tKVpnIDQThbVX1Rry1ClOowvD5fL5HCuFyjEO/R6PZG8hfv1HcwsZHf6x2yukJXnp
 kYUYRBYHvWcLpoTZ2PtvC+AWv1soXZtk5qSLCF3tAVa2P+dnt5PuaNkWhK8FfFy0uDeu7t1DZ
 L1K7cnysO/WmA3VLy++vYxvW64yJLvRYwAKQmJYK9Rw1H6yvl112vXMXr1kg8q2LZzWMcd00G
 oRs7EmSxCLGtRAcP+xHmoqqe3igJM4KaQ36DQ56rHVOqIMfcg8nU8pyWbyfiWkK3gh+ephy+Q
 hiCzGRTf3FCb/xsBQF1yF/NgGlDZthcjQHDmo7qOAAFuui0AsgZn3/llzvziSTNrBDe/7/Z/x
 64cXu5/TcXT4+MPET3D4RWOzeDXYWa73vZi3rT7vvLEfCZIY/InZkl22Zf0JvWq2LY23AVMHX
 f/W8LH4xUHKD6pmZbfelxvDy5LXRTA3W+SHOvoeeDenUxfAiNLalezLly4xRXlX8AjumiyiNx
 yDAv0EPLcij5ggOovw8n4HkpnxR839o7N/m7g9xdTxWShl4blV6HvUp4DRVmGRRZB9dY/49F3
 QIAgvA6O17GMiOZE2abPeMZ2uB2ISoX00VD8/lRBFAuF0Jxf7t+A7raGqcNW2xnytdwvhxai3
 4uSPWePb+PzdtcotU9GV3RK4/WY5fXFoo3LozFqiF11biTys0jB3iIwz0esmFvxetmaN5Rk1p
 6bX740B5WKs0oskQKvDYdOuUEYqah9vrF+8ItgncUhrugXAYrwDvaWPBkWJhiuT/W092SUkNU
 zRBsNJpvlYhbq38i/7alQ0hvnRWuAD8Qt5ESBcErkF9ms/CcclyX9KJ9aNUu6gorLgsRC95eG
 n6Hd1TlnnIHNAAuugT4JrhplTeE3zJTr3rXh5PwO2f9KVxXXX9eepUaZorIo226H9bjPnDrv9
 EQXPkG5OAkguJrv8UsivPuXOYIkFI3WgKTt4nKFHIjcaKYB71AWGPLE2s3Rp2knaBEy73eXwM
 RmivKUR5qE8a0c2Cvc7/QyVKuf5c3GEMuYvpxSJWyyIrInbFHZNT4NMxcYedpmq8ESigbVVx6
 tnz2v3oH8WNLA8TLtH6AZchiBgdTRLDvM2GunZYUudZwHnf/fScSZ4QGhwTMczy1owUKi11XB
 fFDMY=
Received-SPF: pass client-ip=212.227.17.22; envelope-from=denniswoelfing@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.07, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGluZyAyDQpJJ2QgbGlrZSB0byBnZXQgdGhpcyBidWdmaXggaW50byA2LjEuDQoNCk9uIDA3LjA3
LjIxIDEzOjAyLCBEZW5uaXMgV8O2bGZpbmcgd3JvdGU6DQo+IFBpbmcNCj4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvcWVtdS1kZXZlbC8yMDIxMDYyOTEzMjQxMC4yODY4MTMtMS1kZW5uaXN3b2Vs
ZmluZ0BnbXguZGUgDQo+IA0KPiANCj4gT24gMjkuMDYuMjEgMTU6MjQsIERlbm5pcyBXw7ZsZmlu
ZyB3cm90ZToNCj4+IFRvIGhhbmRsZSByZWxhdGl2ZSBtb3VzZSBpbnB1dCB0aGUgZXZlbnQgaGFu
ZGxlciBuZWVkcyB0byBtb3ZlIHRoZSBtb3VzZQ0KPj4gYXdheSBmcm9tIHRoZSBzY3JlZW4gZWRn
ZXMuIEZhaWxpbmcgdG8gZG8gc28gcmVzdWx0cyBpbiB0aGUgbW91c2UNCj4+IGdldHRpbmcgc3R1
Y2sgYXQgaW52aXNpYmxlIHdhbGxzLiBIb3dldmVyIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9u
IGZvcg0KPj4gdGhpcyBpcyBicm9rZW4gb24gaG9zdHMgd2l0aCBtdWx0aXBsZSBtb25pdG9ycy4N
Cj4+DQo+PiBXaXRoIG11bHRpcGxlIG1vbml0b3JzIHRoZSBtb3VzZSBjYW4gYmUgbG9jYXRlZCBv
dXRzaWRlIG9mIHRoZSBjdXJyZW50DQo+PiBtb25pdG9yIHdoaWNoIGlzIG5vdCBoYW5kbGVkIGJ5
IHRoZSBjdXJyZW50IGNvZGUuIEFsc28gdGhlIG1vbml0b3INCj4+IGl0c2VsZiBtaWdodCBiZSBs
b2NhdGVkIGF0IGNvb3JkaW5hdGVzIGRpZmZlcmVudCBmcm9tICgwLCAwKS4NCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBEZW5uaXMgV8O2bGZpbmcgPGRlbm5pc3dvZWxmaW5nQGdteC5kZT4NCj4+IC0t
LQ0KPj4gwqAgdWkvZ3RrLmMgfCAyMSArKysrKysrKystLS0tLS0tLS0tLS0NCj4+IMKgIDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS91aS9ndGsuYyBiL3VpL2d0ay5jDQo+PiBpbmRleCA5ODA0NmY1NzdiLi41MjU4NTMy
YjE5IDEwMDY0NA0KPj4gLS0tIGEvdWkvZ3RrLmMNCj4+ICsrKyBiL3VpL2d0ay5jDQo+PiBAQCAt
ODY1LDMzICs4NjUsMzAgQEAgc3RhdGljIGdib29sZWFuIGdkX21vdGlvbl9ldmVudChHdGtXaWRn
ZXQgDQo+PiAqd2lkZ2V0LCBHZGtFdmVudE1vdGlvbiAqbW90aW9uLA0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIEdka1dpbmRvdyAqd2luID0gZ3RrX3dpZGdldF9nZXRfd2luZG93KHdpZGdldCk7DQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgR2RrTW9uaXRvciAqbW9uaXRvciA9IGdka19kaXNwbGF5X2dl
dF9tb25pdG9yX2F0X3dpbmRvdyhkcHksIA0KPj4gd2luKTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBHZGtSZWN0YW5nbGUgZ2VvbWV0cnk7DQo+PiAtwqDCoMKgwqDCoMKgwqAgaW50IHNjcmVlbl93
aWR0aCwgc2NyZWVuX2hlaWdodDsNCj4+DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaW50IHggPSAo
aW50KW1vdGlvbi0+eF9yb290Ow0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGludCB5ID0gKGludClt
b3Rpb24tPnlfcm9vdDsNCj4+DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ2RrX21vbml0b3JfZ2V0
X2dlb21ldHJ5KG1vbml0b3IsICZnZW9tZXRyeSk7DQo+PiAtwqDCoMKgwqDCoMKgwqAgc2NyZWVu
X3dpZHRoID0gZ2VvbWV0cnkud2lkdGg7DQo+PiAtwqDCoMKgwqDCoMKgwqAgc2NyZWVuX2hlaWdo
dCA9IGdlb21ldHJ5LmhlaWdodDsNCj4+DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLyogSW4gcmVs
YXRpdmUgbW9kZSBjaGVjayB0byBzZWUgaWYgY2xpZW50IHBvaW50ZXIgaGl0DQo+PiAtwqDCoMKg
wqDCoMKgwqDCoCAqIG9uZSBvZiB0aGUgc2NyZWVuIGVkZ2VzLCBhbmQgaWYgc28gbW92ZSBpdCBi
YWNrIGJ5DQo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIG9uZSBvZiB0aGUgbW9uaXRvciBlZGdlcywg
YW5kIGlmIHNvIG1vdmUgaXQgYmFjayBieQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiAyMDAg
cGl4ZWxzLiBUaGlzIGlzIGltcG9ydGFudCBiZWNhdXNlIHRoZSBwb2ludGVyDQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAqIGluIHRoZSBzZXJ2ZXIgZG9lc24ndCBjb3JyZXNwb25kIDEtZm9yLTEs
IGFuZCBzbw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBtYXkgc3RpbGwgYmUgb25seSBoYWxm
IHdheSBhY3Jvc3MgdGhlIHNjcmVlbi4gV2l0aG91dA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KiB0aGlzIHdhcnAsIHRoZSBzZXJ2ZXIgcG9pbnRlciB3b3VsZCB0aHVzIGFwcGVhciB0byBoaXQN
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgICogYW4gaW52aXNpYmxlIHdhbGwgKi8NCj4+IC3CoMKg
wqDCoMKgwqDCoCBpZiAoeCA9PSAwKSB7DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ICs9
IDIwMDsNCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoeCA8PSBnZW9tZXRyeS54KSB7DQo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB4ID0gZ2VvbWV0cnkueCArIDIwMDsNCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCB9DQo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKHkgPT0gMCkgew0KPj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgeSArPSAyMDA7DQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHkgPD0gZ2Vv
bWV0cnkueSkgew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeSA9IGdlb21ldHJ5LnkgKyAy
MDA7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4gLcKgwqDCoMKgwqDCoMKgIGlmICh4ID09
IChzY3JlZW5fd2lkdGggLSAxKSkgew0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeCAtPSAy
MDA7DQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHggLSBnZW9tZXRyeS54ID49IChnZW9tZXRyeS53
aWR0aCAtIDEpKSB7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ID0gZ2VvbWV0cnkueCAr
IChnZW9tZXRyeS53aWR0aCAtIDEpIC0gMjAwOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+
IC3CoMKgwqDCoMKgwqDCoCBpZiAoeSA9PSAoc2NyZWVuX2hlaWdodCAtIDEpKSB7DQo+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB5IC09IDIwMDsNCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoeSAt
IGdlb21ldHJ5LnkgPj0gKGdlb21ldHJ5LmhlaWdodCAtIDEpKSB7DQo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB5ID0gZ2VvbWV0cnkueSArIChnZW9tZXRyeS5oZWlnaHQgLSAxKSAtIDIwMDsN
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+Pg0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmICh4
ICE9IChpbnQpbW90aW9uLT54X3Jvb3QgfHwgeSAhPSAoaW50KW1vdGlvbi0+eV9yb290KSB7DQo+
PiAtLSANCj4+IDIuMzIuMA0KPj4NCg==

