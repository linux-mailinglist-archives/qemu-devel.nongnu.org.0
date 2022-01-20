Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A265495072
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 15:42:59 +0100 (CET)
Received: from localhost ([::1]:47222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAYeQ-00018N-CM
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 09:42:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nAVey-0005cB-SJ; Thu, 20 Jan 2022 06:31:23 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:20914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nAVep-0006XZ-NN; Thu, 20 Jan 2022 06:31:19 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20K9n4Rb014084; 
 Thu, 20 Jan 2022 11:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=P2oFOdqFRE74JhGVEbVkhg1HsgyiUOjdrYX2KRXKAnc=;
 b=f5MKERNtezqR/TE3eop9YXVafus9/Etvs7cHi8+LNSifY4VopNabL5q6jPPXbxa7Zjzr
 xEkB9/GSPRnrB3QVFEA5w/JbrH25MhLBSVo0/8xe67fu/BlboQ+ss994n6ovBocO8q+Q
 mMjy3ptUStiYvh5hi/XnfK7C18SeCnUJGwCl3XDwgw5rFZVNi9826Rg1394obgMiN4vy
 bXIpnTIfxPb3nwl0SNxvBKjFfeZ/57COKO9KonvRubL+IetMU7YxjqpTz/Tt3H19ijQk
 VfUMZx445n619X6Fa/L6SRqEZdTfrMzW2T7eefKR6Q9CQuAJ7Y+sIZY6YCjvjLOjmRjO lw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc51fqcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 11:30:14 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20KBGfYj031345;
 Thu, 20 Jan 2022 11:30:13 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by userp3030.oracle.com with ESMTP id 3dkkd24hb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 11:30:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jS1/ESU3OLJAHYIiwQt/odktpKpffR0Xn9AbTio/8LBsSu6jlxhnYRmoGWEzQ+WIxwhzmMuas9zquX5GTA9rCkXimDkQ9mrXCqce1IyTeaNrn+WPMw00OsYHUP4EEix3SpaWYZHUq79/w0cdBHMIfZSumkh1IFViVOAmR/Scr1BKNRBh49hJ4b4izlXj6uYCBOIfDK1YikAI+0+YpdMoZJt9im109lph9Kr5Gw+3+YgWYb8qsBF1WfHMDrtf9zZW99nsQrih2B2OgzucvgHkHaEnVTVe/8ZRjNanHgYj+eHCorUtyLGpYLnkyFJNSrDjQq5uDdvN/7kcXCvUtbY57A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2oFOdqFRE74JhGVEbVkhg1HsgyiUOjdrYX2KRXKAnc=;
 b=g+mkIrFjTQhadVPRfxhUTqgqqIVWJX/ZySgOAeJSeB//1hD2AEbmRnEUwdDk6ji4WYo5JYLV/aJtcfXXVDzK0AryrSombQwW+cRC31gaNKOTnpLlIBEGyzRByoXf9b0MJAw1khJ4jOsj/IKOfsBXPO+z4wF9HfyijEIaCA1ea/5BbSqYRN853SqZ8upnS90Q1ZiiDHeg/So3HJ8FbU1KaMu1mgaSvQJICZFq7bDzuLH3OT/1EbB9b7mM/S1qthmH7xXQMIMdIOsmFcfrZQY6kNTY7oMGZzW74ztzl2ROhtwXH4bs49ZocVRAYzjhL+kPeHJewogZvynt/ETR+1QyDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2oFOdqFRE74JhGVEbVkhg1HsgyiUOjdrYX2KRXKAnc=;
 b=allkcGi/BLQlODO7IJlXiZoCDm3AOsryn9FSlyJyc/2D7CY1wTx6HuiKaRmtas7piY2x6wz5zkTlMXCwL+nR3wZDG/Rp3pXQFyVT9ole8b6GK7A+VNTx7aAncxhRjq8Q2olb2cNnQrPukNtIV3BCQ6tnx43QAbuKxwF/gJlRTgg=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by BYAPR10MB2648.namprd10.prod.outlook.com (2603:10b6:a02:b3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 20 Jan
 2022 11:30:04 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::95b1:2ba7:964c:d3cb]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::95b1:2ba7:964c:d3cb%9]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 11:30:04 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 0/8] hmp,qmp: Add commands to introspect virtio devices
Date: Thu, 20 Jan 2022 06:29:20 -0500
Message-Id: <1642678168-20447-1-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0025.namprd11.prod.outlook.com
 (2603:10b6:806:6e::30) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 425c01f3-4051-4f4c-11f2-08d9dc0833fd
X-MS-TrafficTypeDiagnostic: BYAPR10MB2648:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB26481F07E994AF9E7EAF5A4EE85A9@BYAPR10MB2648.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BuTktWb5IGNZdRyKeqz8kGhv/1VHl8p4kmiChw2b1npT12gmxaLwr4qAbSvLWqxl6xPcJE4CkrEKJbS7ZiewcnxYSHA3PDu53yUYw/uwVVCYFynewmqdicy/ViVMo5VwfZloV8kXwWB1axEMLgRsgXOwdW6qySAseKobxy92lzxU8lXJ5gh+l2VqU6UiO1D1lmnT+u5BH4JL3rSRN1alMrX02lfLl4Z17L0Bx/E63PHfgHbktBUx3YFJjRt8UHon3+q+a81fqG5QzrcMTGpKcky9i0LdzN4LQdEWDI75+HURUaJzR6PR0354Zxxp4cPxsoGhzp35A3u4bdFuo8dGLlG0Yacs4UtU5fT8V6kkp0GYXS26AjcaCF+yQwMlMEkFczrWT1qxCh6rUm2WoW+cBTam5DHZ5t/CXtUfwm2viGBeDBGlbTVrr2VFzgH/KIil5Rgv9nZHJVJmAfkNrUP7G1IBbGpNRJjd0m73aLzsYwMQviD/ZlVC18kSsuR1W1cW/wa0HvRxWCG4EurKvhuYbZ9ABf6uDUx5ILA1h0aC1VBqsBkYwD4/MV4Xv6vFx1g3VEm4dOsgS1XRn8Cc4BDlH4E57mKZ/jiP9Q+ofhgM+37dmNMphW7e2GYtVGZCvulWgt5dWl9yv5h7Bka7LY4m4zjJ5P7erbvV8MSXS8EAEtkRC20mWdcu/wIuMy69mgCam0ueNyBAEuUGeWnzz4FzuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(66556008)(6512007)(6486002)(8936002)(66476007)(6666004)(2616005)(66946007)(44832011)(186003)(316002)(36756003)(7416002)(86362001)(508600001)(38100700002)(26005)(6506007)(6916009)(38350700002)(52116002)(5660300002)(4326008)(83380400001)(30864003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Gqo4PJSbAIt20VNzykhDO3PqF66fY5y/t9XyC8IGZUn/vGqhU9x/lewG62L?=
 =?us-ascii?Q?E5PPlQiYmqPUNs8tpS4wAEXc0u0537toVj631krefeNq2dgAggz2pBLg4ZeV?=
 =?us-ascii?Q?lbs3PmMl4HBnpaZ303kZuJ4Ho/0wMErsEsrtDkzNrh/x3C2oJvD3vAxSrW2c?=
 =?us-ascii?Q?9n9VjJwZLQ2UJwBpClgl311ghEyd5v5CL/ltpJZn3B5mXK+kTZSKNh8+bG70?=
 =?us-ascii?Q?q+90ADeWoEZJgeXzUPeHWT0/M8WvnOy/FJervfK8dIcSmMErpJrlKYoK9ncu?=
 =?us-ascii?Q?DW5W6r0odJWssNc2mn2EqpH08rkz4BHDxjdovjaJfJEYyjzuprOd+STZOMYd?=
 =?us-ascii?Q?KN/JpSrdqVbG0HGxJ2IMzp8moEkUc+CiJ3ETlYV2V8oZJa2NHIFvS5erZ7+A?=
 =?us-ascii?Q?rQYlF06EXLydl/v2LG9J1cF7ADDBOWOkF134vLnByV7CzgAxL+Zxvo/pyWi/?=
 =?us-ascii?Q?xl24PYQ/MppugQXGmHqvTlBPSuvcNx0Mad83T6I052p59Y9FwwSkkKadJS9w?=
 =?us-ascii?Q?IORj8D/Ltz1J8lcpXlFnPv3+E6L49HHDizaevcuIFZow+1rkoRCqwf/Eh4Of?=
 =?us-ascii?Q?C7agap0hH33J2h+XGaHjYwmGeSsnOE8pdjvfo4wZfELp5jEPxAG+L38Ox7xx?=
 =?us-ascii?Q?dkYqYPVG2rCgcL8hUt3E/tJQwLDZ5K8Sa+YSgBt9eEd1vse6EQFUVuALoiFJ?=
 =?us-ascii?Q?Sjc7XMhW76wfJSOUxXO7R770jauYWZgfsXNAS51FgBr8SVCYjV+TKh0JnDoe?=
 =?us-ascii?Q?zJhBBKlPM5hH7RRrVFPQT4u0SXChMRQpV5Z4iXR1n0marubN2hsypw4PpcX6?=
 =?us-ascii?Q?ynh8F4Kuonx/Dw8Ol4Rgx3/pNlA2Cafgxa2lWvAwpevh3pWtIhdEG6XVmK6p?=
 =?us-ascii?Q?Fjcn/RX7HUfEvEGWedv3hND0JkmucgYC8WamJpQciid4zFhZftCsP9i7E8St?=
 =?us-ascii?Q?AnG5NkarkAh6hh2R7f2+zNuX1aFJflwNJG6D3lZ4Bqtd2hnNFfORUaCAPAoi?=
 =?us-ascii?Q?xi2Yw3xzUdehT6somQhqf5dQzXdIj1oM7nTSkN/+npAJPCIOIURWBVYpgIUa?=
 =?us-ascii?Q?xsWaJTA/m3leObwptvvNJRgcyxspBURK/neAqd7wSR7ofSvAnR1GKAfSb59n?=
 =?us-ascii?Q?YKSBe51vSZfUMKI7SdRgw0SYKrE/qWVeoiW1jvMj/w7WqLLMEkOdnTP0ukuX?=
 =?us-ascii?Q?qyUuHxL+Ik7Un48DYqzPu9YU4ed6pTg9E0Xt7ZV3sOtni5I1lOHFsyG+9zJY?=
 =?us-ascii?Q?sXrXaafHaWyd99CxP+KAV2E1tZWqqa7Ig2SWytbpbML1f4ydlSMXWcTjwAcg?=
 =?us-ascii?Q?s9oQtclRqd/WJEktD7gPpAnV9gqS1cOem7QQSEa8yOD/pv1PHJMoHD0ABQSp?=
 =?us-ascii?Q?d8J9QGZCo15cw+TGika0PrnaE0+js7JmImSMbjHL0HCgQRwbTAAtIoZSJmeo?=
 =?us-ascii?Q?WVJkvzJWcJbE5xJYh1H8Yu4nE6JyFipeu8OM7DvjcfJ2X9rwgxNdxF86ddFk?=
 =?us-ascii?Q?8q1zDyMFQlzUzx87Jy7CsB9d878GV+d2pgzmQEOM/+sLEZLUJwG4dmiyfcJs?=
 =?us-ascii?Q?kQuWSlVUmf25LXX5UXA/1mXliCoaj2XD3M9jotmcPxwm+EZG2cW3OVcjl76v?=
 =?us-ascii?Q?OhdtP70ybD5uip7PN7As8i8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 425c01f3-4051-4f4c-11f2-08d9dc0833fd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 11:30:04.1270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thpS59CZ+yg1C8NB9Wwuue7DayT6rBwR9BC+TEd0B3et8WoIe0EKh45CI2kv1ohXRYFQL0ThBpJ8pJU7v0A/Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2648
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200058
X-Proofpoint-GUID: uKRUsFpr_YYD7KarfV95C1GVbrNuv-JR
X-Proofpoint-ORIG-GUID: uKRUsFpr_YYD7KarfV95C1GVbrNuv-JR
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series introduces new QMP/HMP commands to dump the status of a
virtio device at different levels.

[Jonah: Rebasing from previous patchset from Dec. 9 (v10). Original patches
 are by Laurnet Vivier from May 2020.

 Rebase from v10 to v11 mainly includes a check when querying or gathering
 any information about a virtio device. This check queries the QOM composition
 tree to make sure that the device (a) exists and (b) is realized before
 attempting to get any more information from it. This is done to get some
 kind of synchronicity between @virtio_list and the QOM composition tree.]

1. List available virtio devices in the machine

HMP Form:

    info virtio

    Example:

        (qemu) info virtio
        /machine/peripheral/vsock0/virtio-backend [vhost-vsock]
        /machine/peripheral/crypto0/virtio-backend [virtio-crypto]
        /machine/peripheral-anon/device[2]/virtio-backend [virtio-scsi]
        /machine/peripheral-anon/device[1]/virtio-backend [virtio-net]
        /machine/peripheral-anon/device[0]/virtio-backend [virtio-serial]

QMP Form:

    { 'command': 'x-query-virtio',
      'returns': ['VirtioInfo'],
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio" }
        <- { "return": [
               {
                   "path": "/machine/peripheral/vsock0/virtio-backend",
                   "name": "vhost-vsock"
               },
               {
                   "path": "/machine/peripheral/crypto0/virtio-backend",
                   "name": "virtio-crypto"
               },
               {
                   "path": "/machine/peripheral-anon/device[2]/virtio-backend",
                   "name": "virtio-scsi"
               },
               {
                   "path": "/machine/peripheral-anon/device[1]/virtio-backend",
                   "name": "virtio-net"
               },
               {
                   "path": "/machine/peripheral-anon/device[0]/virtio-backend",
                   "name": "virtio-serial"
               }
             ]
           }

2. Display status of a given virtio device

HMP Form:

    info virtio-status <path>

    Example:

        (qemu) info virtio-status /machine/peripheral/vsock0/virtio-backend
        /machine/peripheral/vsock0/virtio-backend:
            device_name:             vhost-vsock (vhost)
            device_id:               19
            vhost_started:           true
            bus_name:                (null)
            broken:                  false
            disabled:                false
            disable_legacy_check:    false
            started:                 true
            use_started:             true
            start_on_kick:           false
            use_guest_notifier_mask: true
            vm_running:              true
            num_vqs:                 3
            queue_sel:               2
            isr:                     0
            endianness:              little
            status: ACKNOWLEDGE, DRIVER, FEATURES_OK, DRIVER_OK
            Guest features:   EVENT_IDX, INDIRECT_DESC, VERSION_1
            Host features:    PROTOCOL_FEATURES, EVENT_IDX, INDIRECT_DESC, VERSION_1, ANY_LAYOUT,
                              NOTIFY_ON_EMPTY
            Backend features:
            VHost:
                nvqs:           2
                vq_index:       0
                max_queues:     0
                n_mem_sections: 4
                n_tmp_sections: 4
                backend_cap:    0
                log_enabled:    false
                log_size:       0
                Features:          EVENT_IDX, INDIRECT_DESC, VERSION_1, ANY_LAYOUT, NOTIFY_ON_EMPTY
                                   LOG_ALL
                Acked features:    EVENT_IDX, INDIRECT_DESC, VERSION_1
                Backend features:
                Protocol features:

QMP Form:

    { 'command': 'x-query-virtio-status',
      'data': { 'path': 'str' },
      'returns': 'VirtioStatus',
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio-status",
             "arguments": { "path": "/machine/peripheral/vsock0/virtio-backend" }
           }
        <- { "return": {
                   "device-endian": "little",
                   "bus-name": "",
                   "disable-legacy-check": false,
                   "name": "vhost-vsock",
                   "started": true,
                   "device-id": 19,
                   "vhost-dev": {
                      "n-tmp-sections": 4,
                      "n-mem-sections": 4,
                      "max-queues": 0,
                      "backend-cap": 0,
                      "log-size": 0,
                      "backend-features": {
                         "transports": [],
                         "dev-features": []
                      },
                      "nvqs": 2,
                      "protocol-features": {
                         "protocols": []
                      },
                      "vq-index": 0,
                      "log-enabled": false,
                      "acked-features": {
                         "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1"],
                         "dev-features": []
                      },
                      "features": {
                         "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1", "ANY_LAYOUT",
                                        "NOTIFY_ON_EMPTY"],
                         "dev-features": ["LOG_ALL"]
                      }
                   },
                   "backend-features": {
                      "transports": [],
                      "dev-features": []
                   },
                   "start-on-kick": false,
                   "isr": 0,
                   "broken": false,
                   "status": {
                      "statuses": ["ACKNOWLEDGE", "DRIVER", "FEATURES_OK", "DRIVER_OK"]
                   },
                   "num-vqs": 3,
                   "guest-features": {
                      "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1"],
                      "dev-features": []
                   },
                   "host-features": {
                      "transports": ["PROTOCOL_FEATURES", "EVENT_IDX", "INDIRECT_DESC", "VERSION_1",
                                     "ANY_LAYOUT", "NOTIFY_ON_EMPTY"],
                      "dev-features": []
                   },
                   "use-guest-notifier-mask": true,
                   "vm-running": true,
                   "queue-sel": 2,
                   "disabled": false,
                   "vhost-started": true,
                   "use-started": true
             }
           }


3. Display status of a given virtio queue

HMP Form:

    info virtio-queue-status <path> <queue>

    Example:

        (qemu) info virtio-queue-status /machine/peripheral-anon/device[1]/virtio-backend 2
        /machine/peripheral-anon/device[1]/virtio-backend:
            device_name:          virtio-net
            queue_index:          2
            inuse:                0
            used_idx:             27
            signalled_used:       27
            signalled_used_valid: true
            VRing:
                num:          64
                num_default:  64
                align:        4096
                desc:         0x00000001342b5000
                avail:        0x00000001342b5400
                used:         0x00000001342b54c0

QMP Form:

    { 'command': 'x-query-virtio-queue-status',
      'data': { 'path': 'str', 'queue': 'uint16' },
      'returns': 'VirtQueueStatus',
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio-queue-status",
             "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
                            "queue": 2 }
           }
        <- { "return": {
                   "signalled-used": 27,
                   "inuse": 0,
                   "vring-align": 4096,
                   "vring-desc": 5170221056,
                   "signalled-used-valid": true,
                   "vring-num-default": 64,
                   "vring-avail": 5170222080,
                   "queue-index": 2,
                   "vring-used": 5170222272,
                   "used-idx": 27,
                   "name": "virtio-net",
                   "vring-num": 64 }
           }

4. Display status of a given vhost queue

HMP Form:

    info virtio-vhost-queue-status <path> <queue>

    Example:

        (qemu) info virtio-vhost-queue-status /machine/peripheral-anon/device[1]/virtio-backend 1
        /machine/peripheral-anon/device[1]/virtio-backend:
            device_name:          virtio-net (vhost)
            kick:                 0
            call:                 0
            VRing:
                num:         256
                desc:        0x00007f31c032c000
                desc_phys:   0x00000001340c6000
                desc_size:   4096
                avail:       0x00007f31c032d000
                avail_phys:  0x00000001340c7000
                avail_size:  518
                used:        0x00007f31c032d240
                used_phys:   0x00000001340c7240
                used_size:   2054

QMP Form:

    { 'command': 'x-query-virtio-vhost-queue-status',
      'data': { 'path': 'str', 'queue': 'uint16' },
      'returns': 'VirtVhostQueueStatus',
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio-vhost-queue-status",
             "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
                            "queue": 1 }
           }
        <- { "return": {
                   "avail-phys": 5168197632,
                   "used-phys": 5168198208,
                   "avail-size": 518,
                   "desc-size": 4096,
                   "used-size": 2054,
                   "desc": 139851654676480,
                   "num": 256,
                   "name": "virtio-net",
                   "call": 0,
                   "avail": 139851654680576,
                   "desc-phys": 5168193536,
                   "used": 139851654681152,
                   "kick": 0 }
           }

5. Display an element of a given virtio queue

HMP Form:

    info virtio-queue-element <path> <queue> [index]

    Example:

        Dump the information of the head element of the third queue of virtio-scsi:

        (qemu) info virtio-queue-element /machine/peripheral-anon/device[2]/virtio-backend 2
        /machine/peripheral-anon/device[2]/virtio-backend:
            device_name: virtio-scsi
            index:       125
            desc:
               descs:   addr 0xa4f90f1d0653b5fc len 1862028160 (used, avail, next)
            avail:
               flags: 0
               idx:   2936
               ring:  125
            used:
               flags: 0
               idx:   2936

QMP Form:

    { 'command': 'x-query-virtio-queue-element',
      'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
      'returns': 'VirtioQueueElement',
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio-queue-element",
             "arguments": { "path": "/machine/peripheral-anon/device[2]/virtio-backend",
                            "queue": 2 }
           }
        <- { "return": {
                   "index": 125,
                   "name": "virtio-scsi",
                   "descs": [
                      { "flags": ["used", "avail", "next"],
                        "len": 1862028160,
                        "addr": 11887549308755752444 }
                   ],
                   "avail": {
                      "idx": 2936,
                      "flags": 0,
                      "ring": 125
                   },
                   "used": {
                      "idx": 2936,
                      "flags": 0
                   }
             }
           }

v11: minor reformatting in virtio.json
     added synchronicity check when querying virtio devices

v10: rebased for upstream (Qemu 7.0)
     reformat virtio.json for better consistency
     removed all enums from virtio.json; replaced with string literals
     removed @ndescs from VirtioQueueElement
     removed examples in hmp-commands-info.hx (to fix 'inconsistent
     literal block quoting' error from Sphinx)

v9: rebased for upstream (Qemu 6.3)
    change QMP command prefixes from 'x-debug-virtio' to
    'x-query-virtio'
    add 'unstable' feature to all 'x-query-virtio' prefixed
    QMP commands
    fix odd indentation for qapi/virtio.json
    device features support for virtio-mem
    move HMP sub-commands under 'virtio' top level to 'info'
    top level

v8: add assert in virtio_id_to_name() to make sure we're
    not returning NULL
    minor documentation additions to qapi/virtio.json
    add virtio introspection support for vhost-user-rng

v7: rebased for upstream (Qemu 6.2)
    add ability to map between numberic device ID and
    string device ID (name) for virtio devices
    add get_vhost() callback function for VirtIODevices
    expose more fields of VirtIODevice
    expose fields of vhost devices
    decode vhost user protocol features
    decode VirtIODevice configuration statuses
    vhost support for displaying virtio queue statuses
    vhost support for displaying vhost queue statuses
    expose driver and device areas when introspecting a
    virtio queue element
    changed patch attribution

v6: rebased for upstream (Qemu 6.1)
    add all virtio/vhost types in same order as
    include/standard-headers/linux/virtio_ids.h
    use QAPI_LIST_PREPEND in qmp_x_debug_query_virtio rather than open
    coding

v5: rebased for upstream
    add device name, used index, and relative indicies to virtio queue-status
    HMP command
    add device name to virtio queue-status QMP command
    add new virtio device features

v4: re-send series as v3 didn't reach qemu-devel

v3: use qapi_free_VirtioInfoList() on the head of the list, not on the tail.
    Prefix the QMP commands with 'x-debug-'

v2: introduce VirtioType enum
    use an enum for the endianness
    change field names to stick to naming convertions (s/_/-/)
    add a patch to decode feature bits
    don't check if the queue is empty to allow display of old elements
    use enum for desc flags
    manage indirect desc
    decode device features in the HMP command

Jonah Palmer (2):
  virtio: drop name parameter for virtio_init()
  virtio: add vhost support for virtio devices

Laurent Vivier (6):
  qmp: add QMP command x-query-virtio
  qmp: add QMP command x-query-virtio-status
  qmp: decode feature & status bits in virtio-status
  qmp: add QMP commands for virtio/vhost queue-status
  qmp: add QMP command x-query-virtio-queue-element
  hmp: add virtio commands

 hmp-commands-info.hx                   |  70 +++
 hw/9pfs/virtio-9p-device.c             |   2 +-
 hw/block/vhost-user-blk.c              |   9 +-
 hw/block/virtio-blk.c                  |  31 +-
 hw/char/virtio-serial-bus.c            |  14 +-
 hw/display/vhost-user-gpu.c            |   7 +
 hw/display/virtio-gpu-base.c           |  20 +-
 hw/input/vhost-user-input.c            |   7 +
 hw/input/virtio-input.c                |  13 +-
 hw/net/virtio-net.c                    |  58 ++-
 hw/scsi/vhost-scsi.c                   |   8 +
 hw/scsi/virtio-scsi.c                  |  20 +-
 hw/virtio/meson.build                  |   2 +
 hw/virtio/vhost-user-fs.c              |  20 +-
 hw/virtio/vhost-user-i2c.c             |   7 +-
 hw/virtio/vhost-user-rng.c             |   9 +-
 hw/virtio/vhost-user-vsock.c           |   2 +-
 hw/virtio/vhost-vsock-common.c         |  22 +-
 hw/virtio/vhost-vsock.c                |   2 +-
 hw/virtio/vhost.c                      |   4 +-
 hw/virtio/virtio-balloon.c             |  17 +-
 hw/virtio/virtio-crypto.c              |  22 +-
 hw/virtio/virtio-iommu.c               |  17 +-
 hw/virtio/virtio-mem.c                 |  14 +-
 hw/virtio/virtio-pmem.c                |   3 +-
 hw/virtio/virtio-rng.c                 |   2 +-
 hw/virtio/virtio-stub.c                |  42 ++
 hw/virtio/virtio.c                     | 742 ++++++++++++++++++++++++++++-
 include/hw/virtio/vhost-vsock-common.h |   2 +-
 include/hw/virtio/vhost.h              |   3 +
 include/hw/virtio/virtio-gpu.h         |   3 +-
 include/hw/virtio/virtio.h             |  26 +-
 include/monitor/hmp.h                  |   5 +
 monitor/hmp-cmds.c                     | 311 ++++++++++++
 qapi/meson.build                       |   1 +
 qapi/qapi-schema.json                  |   1 +
 qapi/virtio.json                       | 841 +++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c             |   1 +
 38 files changed, 2335 insertions(+), 45 deletions(-)
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

-- 
1.8.3.1


