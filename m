Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E8639D13A
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 22:13:57 +0200 (CEST)
Received: from localhost ([::1]:51712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpz9f-0000Lf-V8
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 16:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lpz8S-0007j5-2R
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 16:12:40 -0400
Received: from pv34p98im-ztdg02172101.me.com ([17.143.234.142]:41298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lpz8P-0001Lz-AW
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 16:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1623010355; bh=zy5q5tw44Cz/86v7yUEZ5SHm13S/pjK8zj479XSc0nM=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=uii4TT2gM1bEc029ziRDXApOQnx2qiAV75zUz76cgvpx/GEoEUEDa7hTgQpbhXwy+
 mFknGcVQ8YQtkw/zJW0APiMtNdlrTxZ/nENadjsAkyLdJ5kldQKOWXxx/dK85Xpa2J
 6FjHS6bX1ZLVbNXpnGs27xFxjB7UOy0cxKdSEfe3mEYGxw5Ilq8PlaWYO2b3vFBFMM
 dmNdHpTe9//qMZ2SLNSjrP1wRAajvFEvpJPOtpRNDicp2uA3mHQw7Mo1FwV7F/u3Qz
 pzSdSsTMfRJTGQMHFDQWC9TXpGU7C44xEDhHuvQkxpGA3Ec7m5gtjPlfuc/0r4s8ku
 B6gVUoNIa8sIQ==
Received: from smtpclient.apple (c-67-180-181-196.hsd1.ca.comcast.net
 [67.180.181.196])
 by pv34p98im-ztdg02172101.me.com (Postfix) with ESMTPSA id 8D1275400D6;
 Sun,  6 Jun 2021 20:12:34 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [PATCH 7/8] Provide a Console Terminal Block in the HWRPB.
From: Jason Thorpe <thorpej@me.com>
In-Reply-To: <00e68b2d-0f5e-8c3b-f7b4-91977e5bb60f@linaro.org>
Date: Sun, 6 Jun 2021 13:12:33 -0700
Cc: qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5B3E571D-09AD-43D7-8F1F-912EF5A81EDB@me.com>
References: <20210603035317.6814-1-thorpej@me.com>
 <20210603035317.6814-8-thorpej@me.com>
 <00e68b2d-0f5e-8c3b-f7b4-91977e5bb60f@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-06_15:2021-06-04,
 2021-06-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=837 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2106060165
Received-SPF: pass client-ip=17.143.234.142; envelope-from=thorpej@me.com;
 helo=pv34p98im-ztdg02172101.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jun 6, 2021, at 12:27 PM, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> On 6/2/21 8:53 PM, Jason Thorpe wrote:
>> +  hwrpb.hwrpb.ctbt_offset =3D offsetof(struct hwrpb_combine, ctb);
>> +  hwrpb.hwrpb.ctb_size =3D sizeof(hwrpb.ctb);
>> +  if (have_vga && !CONFIG_NOGRAPHICS(config))
>> +    {
>> +      hwrpb.ctb.term_type =3D CTB_GRAPHICS;
>> +      hwrpb.ctb.turboslot =3D (CTB_TURBOSLOT_TYPE_PCI << 16) |
>> +			    (pci_vga_bus << 8) | pci_vga_dev;
>> +    }
>> +  else
>> +    {
>> +      hwrpb.ctb.term_type =3D CTB_PRINTERPORT;
>> +    }
>=20
> I'm concerned that you're initializing only 1 or 2 slots of 34.
>=20
> It would seem that at a bare minimum the struct should be zeroed, and =
the device-independent header (4 slots) should be set.

I'll rework it.

> I notice you're setting term_type (offset 56) and not type (offset 0), =
which is where my documentation says that CTB_GRAPHICS goes (Console =
Interface Architecture 2.3.8.2 Console Terminal Block Table).

It could be that the value was mirrored in both fields.  I'll =
investigate further.

> I'm also confused that this
>=20
>> + * Format of the Console Terminal Block Type 4 `turboslot' field:
>=20
> says "type 4", but you're actually using type 3 (GRAPHICS) above.

Yes.  The GRAPHICS type was originally just for the TURBOchannel =
systems, but when the first AlphaStations landed, SRM continued using =
GRAPHICS as the "term_type" ... it's entirely possible that the "type" =
field was in fact set to MULTIPURPOSE in that case.

> But I do see that what you're filling in is exactly what netbsd =
examines -- no header checks, no size checks, or anything.  And that =
openbsd has an exact copy of that code.

I'll see if I can figure out what Digital Unix does.

-- thorpej


