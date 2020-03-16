Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9635E187634
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 00:30:16 +0100 (CET)
Received: from localhost ([::1]:50330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDzBX-0006bH-MQ
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 19:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <npiggin@gmail.com>) id 1jDzAN-00066x-Qx
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 19:29:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <npiggin@gmail.com>) id 1jDzAM-0007Wq-W3
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 19:29:03 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:38719)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <npiggin@gmail.com>)
 id 1jDzAK-0007Rz-V8; Mon, 16 Mar 2020 19:29:01 -0400
Received: by mail-pl1-x62d.google.com with SMTP id w3so8723979plz.5;
 Mon, 16 Mar 2020 16:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=lrOZIh3X4wRaSVYuIdvHfdq80F+MYQj4F/Gd+IbovCk=;
 b=BnlxEAOhkNWMWjSRa4SMKilbJ5coIA78rJ2hhX2DV7++HjX454vb74OMLdh1ruEJOp
 8mVMGWpiy8hNNGZyk0Ee97YRUSGffvo/a4EN6jcVHta99pUaGyTyWvFtc45v4wxZU9Np
 McexJfUXsCIyv78JtG6/auqquwR+VG+bGDWFQ8sF0NTblfs4tUGmPVsN9fjDdejE5gN0
 JQotfk4TAcRkVo3wPX0mBw2r+nJMb4pGVTnq2UwO62Y6/35UALJimd9kY1Byzs4xJxVs
 HEcj8ZQMU7i5otcq55bjeHAEcYbAHtv13CF4Sf9TrszFe4FyRA9TmPA/xidZSx87ttoq
 3+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=lrOZIh3X4wRaSVYuIdvHfdq80F+MYQj4F/Gd+IbovCk=;
 b=nwuUMiMrUMl2gOfzUv2kXPTVQ+skRzn9IinurvQ6u8101TY9Te87VOux+a1+w9TtOn
 IWJOazEQwCy0flYpT+kgKikHvI8vmNxEtrGUhb8/5KvTofj9C+kVRmxejnvPBNAs+sbt
 3DtCBza2xiA2AplMlQDe3Inm+1l4EN+8zpkZnlKm+uOFkT0RRtIs4eELWiDkDPWwegLz
 ctbqsc5x8mgN16xRTszDrkD2k6rROEjYqroTdkcZXkbrVrhaJ2Pb9sapIM9u/q9aWFVt
 xlUltrmx4l5L67Gk1VJwy8QyOJT4ywljW8/KOa2ezkJMUDmcKOB9vrDdX/QdcMPXXfmA
 SQHg==
X-Gm-Message-State: ANhLgQ1RY2MArgzUXghGH1q3hnLRAwWPF3NVpSVYzGH+IwJFGx/NtWyw
 3H2G2WQbix0cSzfU3OZ8Esc=
X-Google-Smtp-Source: ADFU+vuBUIUdraWVX3Bhvi+mOg/F8vuVr41X5UgAPgPUUF9ij5Y6QkYD+35uBc6QgNT57rLEssJTXQ==
X-Received: by 2002:a17:902:b118:: with SMTP id
 q24mr1645216plr.0.1584401339982; 
 Mon, 16 Mar 2020 16:28:59 -0700 (PDT)
Received: from localhost (203-213-47-190.tpgi.com.au. [203.213.47.190])
 by smtp.gmail.com with ESMTPSA id d7sm937186pfa.106.2020.03.16.16.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 16:28:59 -0700 (PDT)
Date: Tue, 17 Mar 2020 09:28:24 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 6/8] target/ppc: allow ppc_cpu_do_system_reset to take
 an alternate vector
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org
References: <20200316142613.121089-1-npiggin@gmail.com>
 <20200316142613.121089-7-npiggin@gmail.com>
 <85cfff63-88e3-b5a5-75e3-aa29ac13ff60@kaod.org>
In-Reply-To: <85cfff63-88e3-b5a5-75e3-aa29ac13ff60@kaod.org>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584401195.r6knelt82x.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62d
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
Cc: Aravinda Prasad <arawinda.p@gmail.com>, qemu-devel@nongnu.org,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

C=C3=A9dric Le Goater's on March 17, 2020 4:15 am:
> On 3/16/20 3:26 PM, Nicholas Piggin wrote:
>> Provide for an alternate delivery location, -1 defaults to the
>> architected address.
>=20
> I don't know what is the best approach, to override the vector addr
> computed by powerpc_excp() or use a machine class handler with=20
> cpu->vhyp.

Yeah it's getting a bit ad hoc and inconsistent with machine check
etc, I just figured get something minimal in there now. The whole
exception delivery needs a spring clean though.

Thanks,
Nick
=

