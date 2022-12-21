Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26F06530AE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 13:18:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7y1v-0003zs-AP; Wed, 21 Dec 2022 07:17:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7cc631609c1bd8ad3247+7059+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p7y1m-0003za-KA
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 07:16:54 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7cc631609c1bd8ad3247+7059+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p7y1k-0004S0-4Y
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 07:16:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=XLBlZGLseWK03HIE52fk6TBWlUReo+VsxwFdq8QHsFs=; b=iliHyJw803O2AW7I7V5k/NXfBV
 Eb7bfVg0X4YsUJWocPo1fX8YHeQ71VuVsrbVcFENPy2oeOHKq2HKDMvIqWOUYku5RAMO8V/2yaO1x
 WfAqHEQTmNetGJH68OvFE1ivelDW4SAxS0lW8wYsiTgcTTiR30LdJ+R87M428B6BRc3MXPIUFo4fl
 IwXI8RTYLJvLGXDQ5a8xLk2M8bexCyyW/7fFjVZvhXwG7AozTSoGd7EafJkuRO2+MLCofBRaPtARD
 725iOBgbfpd3PKKioGYeRdBkvkRK/ffUTa3YajSKoKD3Ow8sZLQVk+6dH5RwrS5Z0+U9M69lg3wcl
 EG9R91MQ==;
Received: from [2001:8b0:10b:5:1553:7ca1:1958:50f4] (helo=[IPv6:::1])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1p7y1Y-00DM7d-2q; Wed, 21 Dec 2022 12:16:41 +0000
Date: Wed, 21 Dec 2022 12:16:40 +0000
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
In-Reply-To: <023d20b9-63e3-e870-facb-a424f2008622@xen.org>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-21-dwmw2@infradead.org>
 <f4b7feff-c41a-25c6-d098-c4eab9b94eb1@xen.org>
 <a78a46825b6f726d78beeb0464a3c30cdfd0b9fa.camel@infradead.org>
 <023d20b9-63e3-e870-facb-a424f2008622@xen.org>
Message-ID: <90459758-D14F-4B03-A7EF-A7BEDE311CA1@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+7cc631609c1bd8ad3247+7059+infradead.org+dwmw2@desiato.srs.infradead.org;
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



On 21 December 2022 09:37:36 GMT, Paul Durrant <xadimgnik@gmail=2Ecom> wro=
te:
>On 21/12/2022 01:41, David Woodhouse wrote:
>>>> +=C2=A0=C2=A0=C2=A0 exit->u=2Ehcall=2Eresult =3D err;
>>>=20
>>> This is a bit on the ugly side isn't it? Why not return the err and ha=
ve
>>> kvm_xen_hcall_hvm_op() deal with passing it back?
>>=20
>> Because 'return false' means qemu will whine about it being
>> unimplemented=2E
>>=20
>
>Ah, ok=2E Yes, I did suggest turning that into a trace, which would mean =
that only those who cared would see such a whine=2E

We have both a trace *and* the UNIMPL warning=2E Neither are enabled by de=
fault=2E

