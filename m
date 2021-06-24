Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54CC3B295D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 09:34:17 +0200 (CEST)
Received: from localhost ([::1]:56060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwJsO-0000Ui-AV
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 03:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1lwJql-0007s3-KE
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:32:36 -0400
Received: from mail-bn7nam10on2057.outbound.protection.outlook.com
 ([40.107.92.57]:5920 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1lwJqh-0002X9-VS
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:32:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kd9naAU+lE6DNttU7/NStW21QHR6Pfk41IMeKbs8vimsBqicxdYcZPz77KG2TLD4Idus3nyildniN+aEQq/2w6+21WjvgEIe5HMkj/HY2nFRkXJDvlhKoKLvCwmqSTNL53jN4K7g+sVv0uiuEAPOcq5ddSQQiLyN5w+VdS2W2rggA00fimZOJ1AmGgu8Xy6bNKJcmYm8ljHFq+oN0f/TjHxfVT5hFmVQ4xz1/q+DKi7imkTobF8vwpzQbCvQmG+aftQGVWCMZ2uowHwn5fj9Oc73JGo8VnJKl9f3D59yVj6y2FPVS8hnUz8efHmaT6+SMtC7EFkRmGWs/2xBO5TNLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5/IpbRT5pIpN4XtG0WDeZxlqTxlyiAVhavci3Lw5gc=;
 b=aYdNtimF4j9CTuJR3iKzJCW0QoDXaqtgKNTeu4poY174fujf6jZduU2r+XzuNlCAP5vSar9WZN44YFnzTTFNDK/NaULaMzcPK4tloF3rRFCZY6xaSmBmhewnb7HkWxEtQzEVIB/h34pmBwPm8tKiB6PbVQhVCWSKqyRJqaaLz/vJ8/93AWRhjZD1cxtshBkPl+5V7YKLxPA1OsFepho5f1zYKsSJqn4Wki1mHZjassgDOrYPK+A5A0NlN3V0MpMXMq1yv/+suMugmU9/pXsN4ku7Slv74gl8uwIOsqIZdCXd1dQu25LA3nKa7Bq+JypPpybVZEUM5QVclmbQ0LA8sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5/IpbRT5pIpN4XtG0WDeZxlqTxlyiAVhavci3Lw5gc=;
 b=GAImjRIpXdLVpWvhzAUBfXvSXGmAiLl5+fJpiCm/GQnefHF7lceEoiTWkGM1pdViSTQR1PIN23xC2M514GN2nt8M7KJNWpxXU5J45dx4OmarCw3l/9SCDYj3jM8FNnSNo2JRfh5y7lOlEy9NfPNfLtRy8jIBZEFHq9gIbfjluQdg2tTN/yvtB9HNosgzCUfugCWd4S2qODPqo+PD48dTFOzbutD6CShmyGvuo5FDyWqxxVrP9QvyzEUnuf8i34tDEygj5RK+ZGJ23nOnlqfZvO4IbZizoUR1fvhZfVSwSlfEDPytWcCn1qSOsM6U/XAHBtZXULDufsLerVxx6lYGrg==
Received: from BN9PR03CA0623.namprd03.prod.outlook.com (2603:10b6:408:106::28)
 by CH0PR12MB5121.namprd12.prod.outlook.com (2603:10b6:610:bc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 24 Jun
 2021 07:32:29 +0000
Received: from BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::f2) by BN9PR03CA0623.outlook.office365.com
 (2603:10b6:408:106::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Thu, 24 Jun 2021 07:32:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT054.mail.protection.outlook.com (10.13.177.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 07:32:28 +0000
Received: from mtl-vdi-166.wap.labs.mlnx (172.20.187.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Jun 2021 07:32:24 +0000
Date: Thu, 24 Jun 2021 10:32:20 +0300
From: Eli Cohen <elic@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 06/18] vhost-vdpa: fix leaking of vhost_net in
 vhost_vdpa_add()
Message-ID: <20210624073220.GA42206@mtl-vdi-166.wap.labs.mlnx>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-7-jasowang@redhat.com>
 <20210623150016.mdrk35bkxfr3ww43@steredhat>
 <20210624070609.GA41237@mtl-vdi-166.wap.labs.mlnx>
 <53867f1d-5b57-29f0-ff1d-a3f2002c4324@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53867f1d-5b57-29f0-ff1d-a3f2002c4324@redhat.com>
User-Agent: Mutt/1.9.5 (bf161cf53efb) (2018-04-13)
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53e2b052-fb2d-4d99-b347-08d936e238b5
X-MS-TrafficTypeDiagnostic: CH0PR12MB5121:
X-Microsoft-Antispam-PRVS: <CH0PR12MB5121FD326005F04328976BC3AB079@CH0PR12MB5121.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /gN7pS7TJjfqknCF0afSLN50z3u1r2mx1o2dVddr2BGjx+b9uDTjkUdhiqYQruQLrQYrCaoa69SuKSNrd80pZjwsit0YLBvTfKBNEusXHxrjwoz/H6x3M6wcM54iKLmnW0EMGjy+HncHE9lKt+Qzyfy9D8I0CfU1iBc9wJSE6kk7oViStboZKg1muKsK4EreOG68yqFp1tS5AmkG671ZdEUN/YWYerDJHKlCNSOSP9qbU9FAwCQieO0Zkx2vMlkvai/YsP+4gpMxvWrX/J/am6HsyOBF480HHq0XI58xFBZu7QuIkTnfk9TltbIq1ehVQjxszam5z2LQUmk5a8fVhIO2fDWex40cUW2HuBqA2qjMcc8UQ+gH7TcTfSoHM2ZO4APDQojAqOvWV2TEZWKPe1NxgEEFaygNYqazcZY0lI7QP42+pz97XY+wGDxc8ilynrSuWwXtuW+OcCxibw9xEPf+oBpEk7vNn1FQhtkKVYEzek8ooYUU0VNsaXTFpRhJmwq626hVbEF5JUChshhbYszg50I8cFzjmiAdBtjOBcMFj5GFPmG7DmzRmY8SuTLsAWwyx0ZxggozfyKb1qsiwaXcYg54nKFjMfZjAcgXtvvnQeGizayKSt11WEcQZBQUoHuuiqz91qAaU6A7ProwosEAcfNvFDhElIJVdzVf2GI=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(36840700001)(46966006)(186003)(356005)(16526019)(7696005)(316002)(54906003)(9686003)(36860700001)(82310400003)(36906005)(6916009)(83380400001)(33656002)(7636003)(82740400003)(26005)(86362001)(6666004)(8676002)(8936002)(5660300002)(336012)(70206006)(70586007)(1076003)(2906002)(426003)(47076005)(4326008)(55016002)(478600001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 07:32:28.9697 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e2b052-fb2d-4d99-b347-08d936e238b5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5121
Received-SPF: softfail client-ip=40.107.92.57; envelope-from=elic@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: lulu@redhat.com, mst@redhat.com, qemu-devel@nongnu.org, eperezma@redhat.com,
 lingshan.zhu@intel.com, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 24, 2021 at 03:10:46PM +0800, Jason Wang wrote:
> 
> 在 2021/6/24 下午3:06, Eli Cohen 写道:
> > On Wed, Jun 23, 2021 at 05:00:16PM +0200, Stefano Garzarella wrote:
> > > On Mon, Jun 21, 2021 at 12:16:38PM +0800, Jason Wang wrote:
> > > > Fixes: 1e0a84ea49b68 ("vhost-vdpa: introduce vhost-vdpa net client")
> > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > ---
> > > > net/vhost-vdpa.c | 1 +
> > > > 1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > index f5689a7c32..21f09c546f 100644
> > > > --- a/net/vhost-vdpa.c
> > > > +++ b/net/vhost-vdpa.c
> > > > @@ -111,6 +111,7 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
> > > > err:
> > > >      if (net) {
> > This check is redundant. net is not null.
> 
> 
> Actually, it can:
> 
>     net = vhost_net_init(&options);
>     if (!net) {
>         error_report("failed to init vhost_net for queue");
>         goto err;
>     }

Hmmm... right.
> 
> Thanks
> 
> 
> > > >          vhost_net_cleanup(net);
> > > > +        g_free(net);
> > > >      }
> > > >      return -1;
> > > > }
> > > > -- 
> > > > 2.25.1
> > > > 
> > > > 
> > > Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> > > 
> 

