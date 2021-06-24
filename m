Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978703B2783
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 08:40:37 +0200 (CEST)
Received: from localhost ([::1]:38892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwJ2S-000104-Lv
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 02:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1lwJ0t-0008Tb-2e
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 02:38:59 -0400
Received: from mail-bn7nam10on2064.outbound.protection.outlook.com
 ([40.107.92.64]:37760 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1lwJ0r-0000hF-3m
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 02:38:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUOboiW7yMLb9wI6WrAc8CfkEyuk5Wgx0cpuRlT7El58pbGfWSxCutiAT/Z1WQFj6Vuk4OBGtoo5yfHJu5Pje5T1pzv61ywjyr01ZGMbJq3yJiDXZcMCkrsbtLnCMKiNdPcOBhiYFpMwLiTtF5Wu5VmAyO5Akc8b+7KsFY4Q1tfhfi+XNrtXID/bcTQSlyt/30Mt3MIxILDuq3WZieGJESa0jtzWoOfAhnMnlbbQHyXVuV4H2WnDq1p5RAL+z+uFBhLJAeBOE4khVCOd/rcXVLEd01qNTt/Jk2kCQ1ZEuVBKi+CqDCSEm4G5zZKHLbvPmPujbN70LoAfY5QXXIaXjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIG6b/uadCn3ic08X5RfWiz7Ru1IzQ9HpC9wNXzW+X4=;
 b=cggPEUKMLpq9QThmAY2be7kbC7yIX+JkRQ6hZCXSHIVDHMWV15s97wxuwyf1YV960eaWGizEwrxMlYIHVnTJXDyfeZSyrtIW9gdl5YufKO5Pf2/idYlTyaYiN2cwnhpDSwE9o6K0Satte6LR713/YHnMVQ1dn+MfssQcZPCjjx3jDcB1LfshVGzcep9Kz2LDxSfY+3v9pqusaXXZEg+a61VuEIIRn6lz0+X71Z11GAfRBUqrmXkiN2ghoKIfBYJOrxEiBAyNju5BpzCnUN5DmhdH8LBaqe1q0a5m8gh/qYCUqJ/APjShkdCzpseB4L7qN3TnQtZ4kAInmB5YJ/mp6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIG6b/uadCn3ic08X5RfWiz7Ru1IzQ9HpC9wNXzW+X4=;
 b=eGoHPsq5MrTkIf7ICo+dqmVjNinjr2fyfaTowk5BRI3aJ5n8h0nQztw00nM+fWYTI66zd2r3gzqEi4mt7pgnFawUR67HI/pQa0HXK2pEAD6S9gj9XsYx0YkXtoGxpQPCgBmRPhnwKltcaOh0yjRVBdNvPaTMuhbo9nmwHGWQsj2HJ2NF5w5/zQRJvNXcGISx1hPxukBgoXEvnXDdb2oXKXqRXJl8efIF+ynRlztrKi9xIc7epUi8VLhStLbN8oFboBOhT7Fo2GwOK92LGDqr1/tpjiLzjN3g7MMZv1WObQezAOaT69uElo6dMLbjaztFjgu+OswgFWfPQNHnSMcyjg==
Received: from CO2PR06CA0076.namprd06.prod.outlook.com (2603:10b6:104:3::34)
 by BN6PR12MB1921.namprd12.prod.outlook.com (2603:10b6:404:fe::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Thu, 24 Jun
 2021 06:38:54 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:3:cafe::22) by CO2PR06CA0076.outlook.office365.com
 (2603:10b6:104:3::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Thu, 24 Jun 2021 06:38:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 06:38:54 +0000
Received: from mtl-vdi-166.wap.labs.mlnx (172.20.187.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Jun 2021 06:38:51 +0000
Date: Thu, 24 Jun 2021 09:38:47 +0300
From: Eli Cohen <elic@nvidia.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 04/18] vhost-vdpa: remove the unnecessary check in
 vhost_vdpa_add()
Message-ID: <20210624063847.GA39216@mtl-vdi-166.wap.labs.mlnx>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-5-jasowang@redhat.com>
 <20210623145359.bi4vrsg63la3l3id@steredhat>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210623145359.bi4vrsg63la3l3id@steredhat>
User-Agent: Mutt/1.9.5 (bf161cf53efb) (2018-04-13)
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34a8a8b9-dd80-4d57-0f20-08d936dabcc0
X-MS-TrafficTypeDiagnostic: BN6PR12MB1921:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1921DF6E003144BDBE6662B0AB079@BN6PR12MB1921.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:486;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EkkV7wcR/SzzmOSXLjM0xni9/7VS3MHrGvVVqdQYjeFelOCjrUhVkEKBc4/6Hqc60fPDMSGDT6EKj8Bs1EnvRjMqd7GQCza8r/2drluoxEA713qqHnAHLJHlBwkFdJc682JEqBBGnzzrRbciYF/aflIVqveqn2tRbOVp+ECATIOCZpVib1YRuCP1T8j2JE2HsXddiRHDk38rHkb9xIPyt5jyCDNgOV/mymN5PNHT5VTeC7/e3GkUvuCXDcTsmHPXbMpiVdlUUgZa7A43d6TmPaCJ0R1a5RqMyQffS/Z5fnn1FeZ1gCVVLTrP/t5PY8k+oVawWfwdlskgwZBTBTHNzvwTldTRrwbFXKJO7OTMu4QHUK/P+x+qlM1x0XeTdkLHmFg+k/f56GBRs/PQOX11gTYSIhgneVPu4OROlnXi/dykqx2/Hiu+qESte3fgf3pWAdjEhyCnRoUVKjBtvgi4iapeVo2lXsXIB7p1dUymu0z2wQ9E5MS6Htk3ui8PRI+r1crp/e+SN6xSyUB3etky9HsftT44xTfyN30UaBVIykNVrqr2BoVtDrYxnkAZoaIW9C3ZvIHTRJxr19tbcWtjUTC2QEGdB2IswcVlDhURDB9uIg6WhWRSDADmPUds58MItWEEwX1ErzsjDpxdBPSSzkZJVexjB+e1WrpcdfkWGfoPomP6RQ9Y811F3kZt+DghBcw7HruvaJ32SQTkclJWkg==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(36840700001)(46966006)(8676002)(33656002)(55016002)(4744005)(9686003)(1076003)(8936002)(2906002)(4326008)(5660300002)(83380400001)(478600001)(36906005)(82310400003)(47076005)(36860700001)(336012)(16526019)(86362001)(426003)(186003)(54906003)(7696005)(82740400003)(356005)(316002)(70586007)(6666004)(6916009)(26005)(7636003)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 06:38:54.6030 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a8a8b9-dd80-4d57-0f20-08d936dabcc0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1921
Received-SPF: softfail client-ip=40.107.92.64; envelope-from=elic@nvidia.com;
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
Cc: lulu@redhat.com, mst@redhat.com, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, eperezma@redhat.com, lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 21, 2021 at 12:16:36PM +0800, Jason Wang wrote:
> The VhostVDPAState is just allocated by qemu_new_net_client() via
> g_malloc0() in net_vhost_vdpa_init(). So s->vhost_net is NULL for
> sure, let's remove this unnecessary check in vhost_vdpa_add().
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Reviewed-by: Eli Cohen <elic@nvidia.com>

> ---
> net/vhost-vdpa.c | 4 ----
> 1 file changed, 4 deletions(-)
> 
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 18b45ad777..728e63ff54 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -112,10 +112,6 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
>         error_report("failed to init vhost_net for queue");
>         goto err;
>     }
> -    if (s->vhost_net) {
> -        vhost_net_cleanup(s->vhost_net);
> -        g_free(s->vhost_net);
> -    }
>     s->vhost_net = net;
>     ret = vhost_vdpa_net_check_device_id(net);
>     if (ret) {
> -- 2.25.1
> 2.25.1
> 
> 


