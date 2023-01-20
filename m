Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA80675FCC
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 22:53:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIzJN-00087g-H1; Fri, 20 Jan 2023 16:52:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Bernhard.Kauer@incari.com>)
 id 1pIzJ2-00086N-PO
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 16:52:21 -0500
Received: from mail-fr2deu01on2089.outbound.protection.outlook.com
 ([40.107.135.89] helo=DEU01-FR2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Bernhard.Kauer@incari.com>)
 id 1pIzJ0-0006Vg-GW
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 16:52:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkcoG5fLbfxHsEyBehInk66aig1kZ7aYdm8QbHyktWZAD0tD+SHIYmAU+BaTSbxUxx/bMFHuIwYhMGnzgzyjAwpBAczTecQGv/VnYcFRSsou4qxU3SEnryHciB45/6TRdev1YljM85LBqRLYCFPCUzhjrWECTLB7Px9n8/SpZ0aTn29WLE+9Ir0rectRudMCJ68LNE7b+R2Dwh6eZzQyY5NU+Fi4L2az86h8qosiGglyv03ZEDDWlojXQSaGWv/r0mATdVpoMWLq6WvKHg00ZctIzs/eR2XLQ5u1R3USa9EenKKlF+cgUhe+iHq12/aUzK6B/AiObKYKIt7o4ZH2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7FTXvYyRZfmDBk+1cQNR8nN+jVlmxO40/UUclOZM2w=;
 b=LELLZvopXxvhr0Sh/7SfTJXwtgtjZppJjXjsNn4pO6xdGiCleo562pPSpzyvo9fdW1ru7wB3NsSdndnpboHQjEw/X2s29DIgeV4xXppoz8d14mkbB/I+c+mVVt6o5Jn8EZiwNF7g9FTBonS0MjLbOceW1Fl7CfHa1gtdfIoqOv9LGSumxZaYriHul8HaBuzm4DzspfuY4a4unXY4pcMXxAuThf+5/cmqe/G5EiaNkvxeXI2iAJetGDq5i9RnSbb6/NQ7wXf/M6663BTbplPt7i3Qgc9I2FvUr6I9nItWHTtxScz8XerfMTxVuMcjZaij7KmB1bqPPRfjfOXeN80FnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=incari.com; dmarc=pass action=none header.from=incari.com;
 dkim=pass header.d=incari.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=incari.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7FTXvYyRZfmDBk+1cQNR8nN+jVlmxO40/UUclOZM2w=;
 b=Xy29+/5ksCD/oDJziQTmEobPMR4NwtpL8DvVps9r4HbFXX/R8UWbaTsZ2RLhl9Y7H/V37L3U2Hsq8eFJDSeZy9nxODr4ewiUjXjjm13s6WaAZZ64Gobn9jZ7i6xB1pA1zdv9HrMERsR89a6jXdOnIA9wexYAkYYatMnqCr/8lM2f/yvSsZ55P5wsstiyjcRJ79bbG9QDHBFGv4xl/FD7O8SUlPY94TPFk6QBoG2NuudPE5PDBe7HMmxizuZET/qTaUzwEIhbsAYb/LXwevrw54uxZJnCANR4Xpl/tRLCmESYXFtdxzp8XU/U8DOB/8GdAlaVpBldgiR93nxSnJxQIA==
Received: from BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:2e::6) by
 FR3P281MB2976.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:5f::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.27; Fri, 20 Jan 2023 21:52:08 +0000
Received: from BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM
 ([fe80::69f4:1511:acf4:d040]) by BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM
 ([fe80::69f4:1511:acf4:d040%3]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 21:52:08 +0000
From: Bernhard Kauer <Bernhard.Kauer@incari.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Paolo Bonzini <pbonzini@redhat.com>
Subject: Patch: target/i386: Change CR4 before CR0 in SVM
Thread-Topic: Patch: target/i386: Change CR4 before CR0 in SVM
Thread-Index: AQHZLRlJVQ5PVP7OEECclyRLqseavQ==
Date: Fri, 20 Jan 2023 21:52:08 +0000
Message-ID: <BEZP281MB29654A7598B0274321B7D0BFE9C59@BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=incari.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BEZP281MB2965:EE_|FR3P281MB2976:EE_
x-ms-office365-filtering-correlation-id: 784dd62e-dad8-45ba-99a8-08dafb3093a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lGR2nPnGhCNLDvS8mQd/ELKsEQkNd5G+HEe7IZP05iwW2zEhEWNDl1s/e4nrvB8Io3TxV2H9UevrfkLT6hpaogmx7zjz9IQus12qWh0ehajj3+oE8+e05L64QaWFTb8aq2tfipXvEShuGZif2L5iEa2+DZJrNSGBUHjdD5YqYikZ16LCdsQ3P6cvA3nPPx+SSq4gB/AHHQaG/hqHZRIWPWyN7yNrxvfl1z3zBzPYg0MiZhf7Z2to/lwhlGaGjznysX+uXdgL1pnNVlRfRysk+vOpyD6qorbLZsihty0yc0oNthmT7XqVusf+xcODV3lXp5E0iZH4T7+ZQXQjdu6tOOk8GUw+bGiLtDWaa6RzE7s2tX62tfRTsKtv22ZUjXEbDJcgPoBV6/ayaIGfkbFPvYacwVS+WCTMFvr5HIOXBYC1x866g/W+mbzEF2Vv17hwHp5cBPu1S+A4f0tkxYbDOTSmZs+titXZ/74P4di85LFcw5xpNB9tZL2xu8ydAq7gH0fbYFd4AOXxoo7iXauBWhmDmevh4UL8leEFyrW1T36z0TuCCg9D5tnYt9OzTvucJOROThd+gE8sjTayCldiRPaX/Kxuj7uwAEO5eJ0UStBx66cLgL01IoWAwLokaWPuWs547K4u+tlLVs4vK6sKJD+aFx3osTHkRTefR4EawiBT8otemZFg9srYzJJtgMM8y+TuU9uJPGGm/KCT/DVAjg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(136003)(346002)(39840400004)(376002)(451199015)(6506007)(2906002)(478600001)(7696005)(71200400001)(86362001)(38070700005)(38100700002)(122000001)(186003)(9686003)(33656002)(83380400001)(55016003)(8676002)(64756008)(6916009)(66446008)(4326008)(66476007)(52536014)(76116006)(66946007)(66556008)(8936002)(5660300002)(41300700001)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4vpWgfZB1cwCpRij8DqmfSQVlG0anBvlI+rOBvHHe6HkBuTr29tku9ClNA?=
 =?iso-8859-1?Q?3BcIl00I3eczFGAlhU9L2yphw91oYbEXSFWL65J5sirMcWKl493UsPAbTv?=
 =?iso-8859-1?Q?EGm2w2FEau5Yv19Lpyg7RsbFvk5oarC95gIVEE9ccts555SDwSuAY1Njuy?=
 =?iso-8859-1?Q?Ybs/f+QIhwUGh/eBtFP0wD0WcxxNdaGJwDxSG5IN6z+f+ynVKaB1iR7Y5D?=
 =?iso-8859-1?Q?4OJU8++f2vW+WBCSsk++Ps8FXiv0r4YpDaviu6j/VNPg7SzhdjDhyQoWRj?=
 =?iso-8859-1?Q?RXL7VLa4tF8r4qxumT0FhLBzHIeQWy09gybbLyXvPVGMF5Pwk/EXDfSBGY?=
 =?iso-8859-1?Q?/C28Na/zpNeLTChedcwnsyYDe4QWVXE3pA8pFBh9ZygfnbV/F5th9qKNQR?=
 =?iso-8859-1?Q?4kW80tfyp7zGG7bww4NaLT8nOkS3cCPG2nzdLQi2/jfdbMz6VOVfBWTRtC?=
 =?iso-8859-1?Q?6WB6lDKTsKMqgDZshOqtPFZiE26OkmWfmJeeo1BeJdscOkFUI+1nI5oD3r?=
 =?iso-8859-1?Q?f4eog5rJGaxHZDIaX/pAYO7wLmJuopR39n5WgYw/d7hpNyik0XxFAs8NKz?=
 =?iso-8859-1?Q?74fEUG8c2mMTN1LWrVRAakihIG7gdDzG9JRHWboXbgu1TypH31kLfX9iC0?=
 =?iso-8859-1?Q?6Q/sDcQCYF9xoT9jllrFQEv5kCbCgSlAop3aJpjPSba30w1RJ7CktwbJmh?=
 =?iso-8859-1?Q?Gu+51XvmIxsNsxUDuFR5UffXZxJUwwxBa/HmGEzUEN+oSSV1t6piXCQNbx?=
 =?iso-8859-1?Q?NzWE2IGee+cf93a1zAm33Smk1WZ7ysDCMuLVFhThu5SrBTuIvZztGDx4YQ?=
 =?iso-8859-1?Q?R/yBviwlBFwy80b7p/xXUBDnk5BAYGlvbszLQ7KMJStnqy9t5lNa+6R1oU?=
 =?iso-8859-1?Q?9Kb2OuI29r5AMlOq91gUJsnVp1zjLkqUNLGJWDeElIkCALsQie2uwLNdmK?=
 =?iso-8859-1?Q?qFekj8HYK5G9vYslTqBfvgd/Bj+qRrLFmKnX2x40JFYeAUYW91BmTjb2j6?=
 =?iso-8859-1?Q?5NsUVJqkn4aFqkaFounYo8KXSI5Y/V9eAxhzEtmbE2f8UqQn2EoOsRmfC3?=
 =?iso-8859-1?Q?D8LtQ9PcNC56EA3JoAUABw99AeWwlzafQGWy5KRTh3NMq+7eQ7vuE36vos?=
 =?iso-8859-1?Q?Zk6jwCumUTDS2yArqpFgircOzug7L/eLJWvp6oX+txXseKMLMwJeI6pu/T?=
 =?iso-8859-1?Q?6yM4qnKqeu8/rjuyrRRJTtxLRLPd6zw17v1dbjdplpGM9u9O3W/amr5N0D?=
 =?iso-8859-1?Q?mwcDlxoaizdsXlclAvrSCtj0OYVBxRvnyWfJLWY/VFO2koLUELFoLi+Mte?=
 =?iso-8859-1?Q?TIPPff6PorxqJ9tmxmkMg+GFjmzLM6fQ/XRy7UsEOX4GVfKFIZBas4z5kd?=
 =?iso-8859-1?Q?WIN/WyfwR5K35e2ggF5Xs1bVeXpaYJHrdarGuPkSCkLokgiijkNzJGMX3G?=
 =?iso-8859-1?Q?ZaCJ414M9kkm8wZdV/uMAgxvm8FBY7MQCEUR6zUgwSmbM65TzNdQCLJ6a1?=
 =?iso-8859-1?Q?p4/cie4xhnpuKlWbVkBk4TAiDGuzI4vh3yLvBM9HnGsSfX9JrTBMpZTNl+?=
 =?iso-8859-1?Q?N42JTDTltRT0+o7MawbizPbXG1do5zSJ6FHKoFqgGsFwK6TJ6Rj31KTWvE?=
 =?iso-8859-1?Q?QAMo3Z/VRnCbQOMBK1yWqt4ZXiEW60un/uASkXFXJhfG/m+EKdyCBj1wF2?=
 =?iso-8859-1?Q?W1CEHl/Di246RVSgOAburglfoO8pBLC6hwJ9Yli2?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: incari.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 784dd62e-dad8-45ba-99a8-08dafb3093a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 21:52:08.0229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a46cb45d-70c3-46b7-b011-a63d6a9c3c2c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YTZsYM/lDF6tp10tZJdMzA/J89z3uU4alCHRXV3vzlp4eW9ih9sTerzUz5ErxBMXdQ0673QmfLTRzkBckboLc4fc6IdZXU/q/rs0/Hpww/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3P281MB2976
Received-SPF: pass client-ip=40.107.135.89;
 envelope-from=Bernhard.Kauer@incari.com;
 helo=DEU01-FR2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

=A0There is a dependency in cpu_x86_update_cr0() to the current value of CR=
4=0A=
=A0to enable or disable long-mode. =A0This value is outdated when switching=
 into=0A=
=A0or out of SVM. This leads to invalid CPU state when returning from an un=
paged=0A=
=A0VM when EFER.LME is set.=0A=
=A0 =A0 =0A=
Signed-off-by: Bernhard Kauer <bernhard.kauer@incari.com>=0A=
=0A=
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/s=
vm_helper.c=0A=
index 2d27731b60..229a22816e 100644=0A=
--- a/target/i386/tcg/sysemu/svm_helper.c=0A=
+++ b/target/i386/tcg/sysemu/svm_helper.c=0A=
@@ -312,8 +312,8 @@ void helper_vmrun(CPUX86State *env, int aflag, int next=
_eip_addend)=0A=
=A0 =A0 =A0x86_stq_phys(cs,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 env->vm_vmcb + offsetof(struct vmcb, control.ex=
it_info_2), 0);=0A=
=A0=0A=
- =A0 =A0cpu_x86_update_cr0(env, new_cr0);=0A=
=A0 =A0 =A0cpu_x86_update_cr4(env, new_cr4);=0A=
+ =A0 =A0cpu_x86_update_cr0(env, new_cr0);=0A=
=A0 =A0 =A0cpu_x86_update_cr3(env, new_cr3);=0A=
=A0 =A0 =A0env->cr[2] =3D x86_ldq_phys(cs,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0env->vm_vmcb + offse=
tof(struct vmcb, save.cr2));=0A=
@@ -812,13 +812,13 @@ void do_vmexit(CPUX86State *env)=0A=
=A0 =A0 =A0env->idt.limit =3D x86_ldl_phys(cs, env->vm_hsave + offsetof(str=
uct vmcb,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 save.idtr.limit));=0A=
=A0=0A=
+ =A0 =A0cpu_x86_update_cr4(env, x86_ldq_phys(cs,=0A=
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 e=
nv->vm_hsave + offsetof(struct vmcb,=0A=
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0save.cr4)));=0A=
=A0 =A0 =A0cpu_x86_update_cr0(env, x86_ldq_phys(cs,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 env->vm_hsave + offsetof(struct vmcb,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0save.cr0)) |=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 CR0_PE_MASK);=0A=
- =A0 =A0cpu_x86_update_cr4(env, x86_ldq_phys(cs,=0A=
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 e=
nv->vm_hsave + offsetof(struct vmcb,=0A=
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0save.cr4)));=0A=
=A0 =A0 =A0cpu_x86_update_cr3(env, x86_ldq_phys(cs,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 env->vm_hsave + offsetof(struct vmcb,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0save.cr3)));=0A=

