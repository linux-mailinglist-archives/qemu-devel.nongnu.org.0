Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82307652653
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 19:33:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7gQm-0001SZ-Mj; Tue, 20 Dec 2022 12:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+86cd69625cf8862bc56b+7058+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p7gQh-0001SL-Dq
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 12:29:27 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+86cd69625cf8862bc56b+7058+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p7gQf-0005UZ-7B
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 12:29:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=MchQDo2/Iu+gglJqQfwYiER4eDFttOypACRo+LXJRrg=; b=JEt8HyS60Y1ozSD4z8LdzTzQti
 f2sA2j/pU0rwWaI0OlkOzifxl7egW8uappG+H9d9ljhNSoX/ozpsjYZkf0527UoVj3oZ4QkZhUS9D
 WJGX8NAG3nk3+/t7sc/jgpHX3pscHpEoQ+eREbxLBDnoX9H6IGlDvseFWSjwix0JL1f9m80vJGxvH
 lRWU1WqeVGmme2MQJsYVIfbUxxYCLAEgt+/DMP/8N73yAukk3J1o8VmN1XfqQ3O9zmTsL+w253WJS
 iD5NnzsOeJ9VSFyDuAEsIgymDf+J3/jp3bvKUW0EVMUXBETj46qPC5Gx5yOmof0kFawDA/T5T/sMa
 BOzBMD/Q==;
Received: from [2a00:23ee:1100:d4f:6633:989:ffde:d8b] (helo=[IPv6:::1])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1p7gQN-00D4uk-1f; Tue, 20 Dec 2022 17:29:07 +0000
Date: Tue, 20 Dec 2022 17:29:04 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: paul@xen.org, Paul Durrant <xadimgnik@gmail.com>, qemu-devel@nongnu.org
CC: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>, 
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_v2_20/22=5D_i386/xen=3A_HV?=
 =?US-ASCII?Q?MOP=5Fset=5Fparam_/_HVM=5FPARAM=5FCALLBACK=5FIRQ?=
User-Agent: K-9 Mail for Android
In-Reply-To: <f9a2d62c-8a09-7e46-6435-8ba379e95a5c@xen.org>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-21-dwmw2@infradead.org>
 <f4b7feff-c41a-25c6-d098-c4eab9b94eb1@xen.org>
 <9dbe4265d43063348a8fe6ddd2b732615f0631b9.camel@infradead.org>
 <65ccf311-be94-7cf2-6610-360549b547ab@xen.org>
 <eba6ab55c8fa4bf889744287d006a5c085ba8976.camel@infradead.org>
 <bec6ab0c-c73e-f5f8-f4a3-e35aa0501e6e@xen.org>
 <B09974FC-9E61-4D7E-BFFF-4B2DB9C09AB4@infradead.org>
 <f9a2d62c-8a09-7e46-6435-8ba379e95a5c@xen.org>
Message-ID: <B22F6AF8-245A-4C1B-B0EC-0203554B941A@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+86cd69625cf8862bc56b+7058+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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



On 20 December 2022 17:25:31 GMT, Paul Durrant <xadimgnik@gmail=2Ecom> wro=
te:
>On 20/12/2022 16:27, David Woodhouse wrote:
>>=20
>>=20
>> On 20 December 2022 13:56:39 GMT, Paul Durrant <xadimgnik@gmail=2Ecom> =
wrote:
>>> The callback via is essentially just another line interrupt but its as=
sertion is closely coupled with the vcpu upcall_pending bit=2E Because that=
 is being dealt with in-kernel then the via should be dealt with in-kernel,=
 right?
>>=20
>> Not right now, because there's not a lot of point in kernel acceleratio=
n in the case that it's delivered as GSI=2E There's no per-vCPU delivery, s=
o it doesn't get used for IPI, for timers=2E None of the stuff we want to a=
ccelerate in-kernel=2E Only the actual PV drivers=2E
>>=20
>> If we do FIFO event channels in the future then the kernel will probabl=
y need to own those; they need spinlocks and you can have *both* userspace =
and kernel delivering with test-and-set-bit sequences like you can with 2le=
vel=2E
>>=20
>> Even so, I was tempted to add a VFIO-like eventfd pair for the vCPU0 ev=
tchn_upcall_pending and let the kernel drive it=2E=2E=2E but qemu doesn't e=
ven do the EOI side of that as $DEITY intended, so I didn't=2E
>
>My point was that clearing upcall_pending is essentially the equivalent o=
f EOI-at-device i=2Ee=2E it's the thing that drops the line=2E So, without =
some form of interception, we need some way to check it at an appropriate t=
ime=2E=2E=2E and as you say, there may be no exit to VMM for EOI of the API=
C=2E So when?

If we have an in-kernel APIC then it has a notifier callback on EOI and we=
 can poll evtchn_upcall_pending then=2E That's another point in favour of h=
andling it in kernel=2E

And for userspace APIC we *do* get an exit of course=2E=2E=2E but QEMU lac=
ks that notifier mechanism for EOI of pseudo-level interrupts for that "sho=
uld it still be pending?" check=2E=20

