Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E48C631C9A5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:28:38 +0100 (CET)
Received: from localhost ([::1]:54786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lByWz-0005D5-TM
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shen.mengjiao3@icloud.com>)
 id 1lByUH-0003SI-Sj
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:25:49 -0500
Received: from pv50p00im-ztbu10011701.me.com ([17.58.6.53]:36833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shen.mengjiao3@icloud.com>)
 id 1lByUG-0005zr-2k
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1613474745;
 bh=iFG8TbbH2Nq6brhBRtJhu5ohW/fUmra5/qBpVMgn/KY=;
 h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To;
 b=cdr/Fs7hmfCPlVugacqK5uS2BoFOkMdumJSqsnBpHyzkVlgNSyQQdViMJF3yQbwlw
 sLhg+OGXAoe5vMd+n2F8or4mXG0cRhKtOGaE8Ox6ejRQj+0MtK0NWl0/03mPxIa0He
 /+a8x9/mfnwH6jYtCy11kcCLWAXmgu4AtGmcfD4gvqfjkxyXsHxze1DNWA2TMw4SkL
 wuIMNopK7V8bYEFjOqdbIXtI12+UAEFCZWXeBxUD2HXxTuVvn5r5YCvH+Xh3ZHMfY6
 ycxrDpd0OXHnLNi117ritTZiHKLABtvMieFc+5dtEqFVOAZ8K0azjWQlScxo9iEaS8
 3EGiegi0pFrmQ==
Received: from [192.168.50.237] (unknown [139.227.197.244])
 by pv50p00im-ztbu10011701.me.com (Postfix) with ESMTPSA id C8DE38A014F;
 Tue, 16 Feb 2021 11:25:44 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: =?utf-8?B?5rKI5qKm5aej?= <shen.mengjiao3@icloud.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 16 Feb 2021 19:25:26 +0800
Subject: Fill tlb for data and io address 
Message-Id: <E1B16679-A55E-479C-9EAC-BE7BA9D71235@icloud.com>
To: QEMU Developers <qemu-devel@nongnu.org>, qemu-discuss@nongnu.org
X-Mailer: iPhone Mail (18D52)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-16_01:2021-02-16,
 2021-02-15 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=617 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2102160107
Received-SPF: pass client-ip=17.58.6.53;
 envelope-from=shen.mengjiao3@icloud.com; helo=pv50p00im-ztbu10011701.me.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Look at the store/load helper, it will use the tlb entry to do the address t=
ranslation(from guest virtual address to host virtual address) but where the=
 tlb is filled for the data ram and io address, I know where the code ram is=
 filled(tb_find->tb_lookup__cpu_state...)=20

Thanks a lot=20=

