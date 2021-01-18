Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC52E2FAB53
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 21:24:46 +0100 (CET)
Received: from localhost ([::1]:56564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1b4v-0006RO-QA
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 15:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan-guix@vodafonemail.de>)
 id 1l1azE-000520-Ve; Mon, 18 Jan 2021 15:18:52 -0500
Received: from smtpout2.vodafonemail.de ([145.253.239.133]:38054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan-guix@vodafonemail.de>)
 id 1l1azC-0003o4-73; Mon, 18 Jan 2021 15:18:52 -0500
Received: from smtp.vodafone.de (unknown [10.2.0.35])
 by smtpout2.vodafonemail.de (Postfix) with ESMTP id 606B2120BBF;
 Mon, 18 Jan 2021 21:18:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vodafonemail.de;
 s=vfde-smtpout-mb-15sep; t=1611001125;
 bh=bwr/bN/ILJgd0r2pstmyBnGv4x12vA/Yaeo2hEbQp9A=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=CGIlh11lADJ5YZ1j8Mn5LdPif7NouwNM3ZthaN0Eb19BmigN+3d3/F1OfZVyXfJS1
 4lz8VGKjAicPPWij6RPg6ufzqYArvbS2e3cQqJtVGuOhmujgnQabo+VQVcKU7ZCztR
 uphsZlX57To3PsUFrfb0jZqk7XDHMaf8NTCgDKa8=
Received: from macbook-pro.kuh-wiese.my-router.de
 (dslb-002-206-141-230.002.206.pools.vodafone-ip.de [2.206.141.230])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by smtp.vodafone.de (Postfix) with ESMTPSA id 26FFA1420B0;
 Mon, 18 Jan 2021 20:18:45 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 1/1] linux-user/syscall: Fix do_ioctl_ifconf() for 64 bit
 targets.
From: Stefan <stefan-guix@vodafonemail.de>
In-Reply-To: <57408fa3-8201-b8b5-aa8d-50448a010f43@vivier.eu>
Date: Mon, 18 Jan 2021 21:18:42 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <5B52EBE5-2490-4997-B7CB-944DE3F3AB6D@vodafonemail.de>
References: <60AA0765-53DD-43D1-A3D2-75F1778526F6@vodafonemail.de>
 <57408fa3-8201-b8b5-aa8d-50448a010f43@vivier.eu>
To: Laurent Vivier <laurent@vivier.eu>
X-Mailer: Apple Mail (2.3124)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1864
X-purgate-ID: 155817::1611001125-0000239E-D7094880/0/0
Received-SPF: pass client-ip=145.253.239.133;
 envelope-from=stefan-guix@vodafonemail.de; helo=smtpout2.vodafonemail.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent!

Thanks for your response.

> Why don't you simply replace STRUCT_sockaddr_ifreq by =
STRUCT_ifmap_ifreq rather than introducing a
> new constant?

Because STRUCT_sockaddr_ifreq is the union part to be filled and is =
needed as an argument to thunk_convert() in this loop below:

            for (i =3D 0; i < nb_ifreq ; i++) {
                thunk_convert(argptr + i * target_ifreq_size,
                              host_ifc_buf + i * sizeof(struct ifreq),
                              ifreq_arg_type, THUNK_TARGET);
            }

> In the "if (!is_error(ret))", why don't you use the same size with the =
part that copies back the
> values to the user?

I=E2=80=99m not sure if I understand your question correctly. Well, =
ioclt(=E2=80=A6, SIOCGIFCONF, =E2=80=A6) returns an array of struct =
ifreq, which contains a union, of which only struct sockaddr ifr_addr =
needs to be filled. But that union element is not the biggest element on =
64 bit architectures.

Without the fix the returned data is not an array of struct ifreq but an =
array of some artificial struct:

struct sockaddr_ifreq {
    char ifr_name[IFNAMSIZ]; /* Interface name */
    struct sockaddr ifr_addr;
}

That artificial struct is too short for 64 bit architectures. On real =
x86_64 systems the size of the array returned by ioclt(=E2=80=A6, =
SIOCGIFCONF, =E2=80=A6) is a multiple of 40 bytes, the sizeof(struct =
ifreq). And it=E2=80=99s also a multiple of 40 on real aarch64 systems. =
However, on x86_64 emulating aarch64 with qemu, the returned array size =
is only a multiple of 32 bytes, which is wrong. It is enough to fill =
only 32 bytes with thunk_convert() and ifreq_arg_type is also the proper =
type, but the array element increase has to be 40 bytes.

I hope this clarifies your question.


Bye

Stefan=

