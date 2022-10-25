Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3109860CDC8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 15:43:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onK7W-0000qL-LT; Tue, 25 Oct 2022 09:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1onK7U-0000fW-QR
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:37:28 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1onK7S-00049O-5i
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:37:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=xRs8tU3K8CfOlYK8XhxmJW4UBbxlgLzcMspcMjzcpt0=; b=tb+nKq2mltzkPnBIQE/F65i1pZ
 77scmEI9OoGJaaUe7R+poUzyUbxHtbLwldeqPPZUtmZNO+gyvyflZKfbJxLllTo5mpkmQz7Wf5efb
 uc8M9u+E4CseXohyvce2e2Bi2T019r82wRw/FeBlQfZ0Vc6pXyFUqgSnrt713JkVixXSDjToPE/oU
 IEB8knt1LdSHX3wi4MTv5NzEluhv0AzYjIbViEZwjIeA/6JJ81ZpJUxobaiyTMMBBEMNjB0gorL2C
 RG3gvH+3vqb4KmMyPe3L7+tnmaEJVOAycEvuJNXKFvmzrSVo3KeR0ceNIYdb9n26/aamz2SmPJKzn
 UkyS2qYsTVXyUC326zyHC/daJTDhuoHYhImtxghMosqeB37OTccRjpca5IZOjC2aGIn61DKA5zfeW
 Dl5Dx3imNXK6pXe74WzEq/J6DnJzeBwHTLxPaiSKFp57FATqDjq4IkvG9Xpjb7OZs70rZCqPZ9zYg
 tp7S5yxv/1KEvAm3AXPN/DqjMr6fPJcW1WihS6RE1RDem4mnaIZDQmYu1Nbza3yfl+GhVsllsBf6t
 ZXMiqzpPXt7KMH1IM8a9NhT4Qc0hllbF0DD7/EPs96K9HXkyhfmr+OeA/mozWhzodRq3IWJ6x3HV7
 4qwJykWrxkgJLq5K9OysDhk1yD9hSEvuzIiaNDAeg=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Bin Meng <bin.meng@windriver.com>,
 Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH  v3 13/26] fsdev/virtfs-proxy-helper: Use g_mkdir()
Date: Tue, 25 Oct 2022 15:37:18 +0200
Message-ID: <4457899.TMF1LSB6l5@silver>
In-Reply-To: <20221020115209.1761864-14-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-14-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thursday, October 20, 2022 1:51:56 PM CEST Alex Benn=E9e wrote:
> From: Bin Meng <bin.meng@windriver.com>
>=20
> Use g_mkdir() to create a directory on all platforms.
>=20
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Message-Id: <20221006151927.2079583-7-bmeng.cn@gmail.com>
> ---

Alex, this patch is already merged on master as
f723f626627fda681327075105701695d7c630e5 by yesterday's 9p PR.

Best regards,
Christian Schoenebeck



