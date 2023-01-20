Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669E3674CD1
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 06:53:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIkJY-0001Gq-Ef; Fri, 20 Jan 2023 00:51:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1pIkJU-0001GK-Uf
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 00:51:45 -0500
Received: from mail-bn7nam10on2065.outbound.protection.outlook.com
 ([40.107.92.65] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1pIkJS-0007fG-WF
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 00:51:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cc2CX9IRXsLSswrzCVaCbbt+DMjUufVT58XzxAxNuwj/OqtXjHdgDsO2Ku41xygAMDUZuBD8bS12nUr/slME7SuMR+npixTksVpQHPTL2W6GpfnYxXMBSEdRMLqEJ6C6rd2lGBR1W214ZBMitAyN1FwhiqAbLoY5kzske0DAL/hVXRAw4mbPguHucO3p0m0FvEqKtftBsZV4T+EemapCrcEB6DBLeFA3WSFtnehuU+BhLc71ZC0ocMsieoIhP3YzH0C/5aPEdIozCT/aY9Rfaj6wThF66x1C6YbUUu4KZgsbf9v+d2edPEX3Nu6nk6HKKDNQ1lrXV0fHjsV3OC48sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2WbQH8sI3mglcpQwv9MS9lKDbyQmhRCGE0G8XLGJ3s=;
 b=bbjr+DyWgjIblxsX8JokP06az8HJ+ghgwjL6wovSoDFaSzdtiYuny1sydVgj/EOepzT353ihoAw7JHKMMLQ2cnsE9MFHCziiHPk/jib9v1ovVm9yHoA1wkoQBPXZbJohQZC95I5icjPlCQ5DboAEPdoiyGsdzjs17nMySo25FpeZd55P0wPn1FQmnUs8DkYfqVMvEsNUyuHJlK2ofehYcmcZSqvqxVslvEhcX2geyZHj35ah7NvPiW0AgOLSubOs9PkPjiv+HGyM0DyIdqvAZNVUgTXEF3TOIclxzy9B/QP/uF9IgtMRnvrOw5ewbiVzzmhLeBqqzVaMLt6d8pBcbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=memverge.com; dmarc=pass action=none header.from=memverge.com;
 dkim=pass header.d=memverge.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=memverge.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2WbQH8sI3mglcpQwv9MS9lKDbyQmhRCGE0G8XLGJ3s=;
 b=H0XU3R1OoQHCT5035FICYszJTUbTSov/E5nypxcbj9u9YwSRGdQ9pBpG5uHkXIqERGysA1Qg7waYroqNrRNGj7HT/65SJqygVVWGuv84RsUH8ODuJP8mbeFnG+g8Uf02pel5xWK3Oe8z4gdy7BPWVsMbXMCEoAjqe+787jV59ss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=memverge.com;
Received: from BN6PR17MB3121.namprd17.prod.outlook.com (2603:10b6:405:7c::19)
 by CY5PR17MB6190.namprd17.prod.outlook.com (2603:10b6:930:42::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Fri, 20 Jan
 2023 05:51:37 +0000
Received: from BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::d253:1eb3:9347:c660]) by BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::d253:1eb3:9347:c660%4]) with mapi id 15.20.5986.023; Fri, 20 Jan 2023
 05:51:37 +0000
Date: Fri, 20 Jan 2023 00:51:26 -0500
From: Gregory Price <gregory.price@memverge.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Jonathan Cameron via <qemu-devel@nongnu.org>,
 Lukas Wunner <lukas@wunner.de>, Michael Tsirkin <mst@redhat.com>,
 Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Subject: Re: cxl nvdimm Potential probe ordering issues.
Message-ID: <Y8or3tSnQm5In17u@memverge.com>
References: <20230113091213.00002146@Huawei.com>
 <Y8Foj/12QNl0C96o@memverge.com>
 <20230113144026.000001fb@Huawei.com>
 <20230113144511.00001207@Huawei.com>
 <20230113151206.GA20583@wunner.de> <Y8hG4OyJL7l9oD2f@memverge.com>
 <Y8hJKcy1993SFLLJ@memverge.com>
 <20230119124244.000015b3@Huawei.com>
 <20230119150449.000037f2@huawei.com>
 <20230119161711.000057a7@Huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119161711.000057a7@Huawei.com>
X-ClientProxiedBy: SJ0P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::35) To BN6PR17MB3121.namprd17.prod.outlook.com
 (2603:10b6:405:7c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR17MB3121:EE_|CY5PR17MB6190:EE_
X-MS-Office365-Filtering-Correlation-Id: f38d0a8c-27cf-4825-79ee-08dafaaa64f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JGB/wBbS6TBmo7ie1b7/ts+cTK9bsNyWAbPxSIhg/D1neWtqC0ZSPyNWozu5otvlPC6cm4eYQ12GqthkUv9HhVOITsV8SsnFvaJkNlq3Vq3ZNTIaiu6S6H4C0hkzTxDxgIneHPQEoVho4/23kzHCIzfrxcSeHYu303B5kFKywriVoD6PDWvVdhYUCkOahD4L9P+YwBPLLBvcjiU9ChfueCoDsvFKcfaXQbJokVL8XES/oSLMjLubEAaQG66tv006IAuVir7N2vDPJHME2PaIyT/BPdIsSlxjb74YkjkoiN0gBhYqKLAmuymMH83G+p6adcnRlPeVBdl1VhTKhmTmAgBtCrGtIgPacxBZ9gdyGj4EKxg6l/Zi71AanQHJD8cv5NAZGy8ONjv6UEt/6orgVeMbuX6sSWoxtNIhZM7idv5/5xzN10xvr7lquwQ0M+7hBWSPFkd5Dt/xiYY8jU67hECaYepEmnjUk7amH6r/LoSfU8dOSYSZa5rJL/rwZESRUNfaNlrWUgCr9coM1xdd4KyN6zjiR+mltY7eXqcVdeFTjgFNksfUqzR+J40e1MaW8yET+2ECTo3xLVgUxhCb/TDl95YHmAiAYjsgtW7KW09NftSUDEVq4B9NRapVtodN+WM+047uh6/wFolRmtnBKdvmw/YX9ulYYp45u2glnhc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR17MB3121.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(136003)(39840400004)(346002)(396003)(451199015)(478600001)(86362001)(66556008)(66946007)(7416002)(2906002)(44832011)(8936002)(5660300002)(66476007)(38100700002)(316002)(54906003)(6666004)(6486002)(6506007)(966005)(36756003)(6512007)(26005)(8676002)(4326008)(41300700001)(6916009)(2616005)(186003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ksb6kDLSVj/GftkTOdRWYIgFc0xup9QOJueRAAZMzzxe0kkGwd0wQe1j2++0?=
 =?us-ascii?Q?QzKNMLhrv4dAV1+55HVZq2X5ebQPiMHBkFf/NFCbHduHTHb61Xu/RxCkcXc0?=
 =?us-ascii?Q?svny6P1U1qjUiIXoZjFSyV38WQfqIrbRIvcBGHk95i57Dke5Q9YMuJ+k02mm?=
 =?us-ascii?Q?avga6A412pltT5CU+UmvGE1F8A+WM/3Y2Pxz7oFdZpkFyBUOdzL7DwS7euAS?=
 =?us-ascii?Q?r/9g6OnXTNndFICxpSYioegKxwbY+kbiNrRASQJ4G005LO0TmvTyFy5K7iT3?=
 =?us-ascii?Q?K2DcuotegLvXGjEtBYALrF4VhcZegTbV6rgyp/so1Ii8GtoPGpmL0om2NWwE?=
 =?us-ascii?Q?kcx/QSMYNgPTXyhQDEnntIzUfcDD962mmTJtBuj1W1zTrat/zI4pOiZZa/FA?=
 =?us-ascii?Q?KJ+LpGqU113ZGoYRPNFS8PkASu2G0SQdyg+TJjHNmeSJ48FiJagI7Oz6aC9d?=
 =?us-ascii?Q?lpAND+s1X7L6iYIHyFBZ2H5HOEgBGpwwbmyWBB5LjshIaHLI0h2LRh2Vt1+m?=
 =?us-ascii?Q?dsqpgwGqI4TCA38/yNRhYDHSPWEOo12GomrRxktp0kKA2C5aWB3YlHYBLEED?=
 =?us-ascii?Q?7E4MD7YxrnV3x1M22asTgyTGrQUC6EaIxY3ZPUrdmVYPDq7w4hoTT2GjY31y?=
 =?us-ascii?Q?+7grZPxG7lBAwZr5yv6mO1aiwDrsidae5DmTg80Yy8ZuVC//HjeGUeJved8i?=
 =?us-ascii?Q?ZI67btl9JyoNa+1R8IDFo7yU+XQeCByOqO6CNmacrGY6thC2FS/9Cq/w/bDj?=
 =?us-ascii?Q?2wnLCpdTWyXWUC0oSxHV4smktBkMCvcGu1ggRqSr/bpFGla5ywU1gx0ceNSO?=
 =?us-ascii?Q?Hpc0H+px5VZXbEGYTNgDgZ8O3SSsWCF4FzEOj/6EDTBSwAGJyMTyRyVGucGZ?=
 =?us-ascii?Q?ZbxkmieCZ5XPXHAQ30KibwUMd8DWUQ+b7hJUeGxPsKmA7fknCei20Ha9IPhX?=
 =?us-ascii?Q?6RaNB0uwf+y2/SMC0uwL5miNUKDWcwosQOH1iWLJj0E5dCrL6/Iqcqy9Pz89?=
 =?us-ascii?Q?Lp59tZk/YNXS/xJU2Bwv/AnEHl5UkjJa3OFGrP2Jjxp+fgho608EePGjueBO?=
 =?us-ascii?Q?+pV5nuhdsRNxBx5lBHSZ+l7OaPg246SfPLuoqvdkAvKF17inT2lUCMW65I6H?=
 =?us-ascii?Q?yNiiwkgnJ3ZSjjKuVzXBGVw8+Edm5F1iMQtcCNqzuZG2klYnN7RxIlozi6ZS?=
 =?us-ascii?Q?eMe4MSoKmKT27aEvh7znHbq+MQQnXZ7nJqzbUOCGasgdGZZ3A8Ku6k5HTlKz?=
 =?us-ascii?Q?Ak05UCJDbUVs0PDCPN34kprqeN22JmnMex/EyVQ75Ic/QdnltEaRIqjOYRHe?=
 =?us-ascii?Q?+5+oicwz4eGyHkg/wUcvqNllF7Uw3DjkSDJZqEwnGikTtvjemhC4X7f6/eTC?=
 =?us-ascii?Q?yTUhHNZDmRgRnIHAntSDOeXaYmMmCaql+VB1d4sllrGw2+6yl0f9LKIbtWtQ?=
 =?us-ascii?Q?YTyOaqcbcdXYw7A8fg4xqdoo6tFSELnOErfteDdmhqVXCGYrFV12/Hn0cozm?=
 =?us-ascii?Q?RIKtExVBoPvIyv8W49JbgiI/W/h46aGLJBYBvCmiF1nrM27sZCZK2wvmeue/?=
 =?us-ascii?Q?c6YNDYtrxuTGNjNmrCTNl7ja3tWv0ejshFxjQQyrUkUZU2lZsM3kurB4HfHs?=
 =?us-ascii?Q?wu4tC883GH2t0WWkjrT4wrY=3D?=
X-OriginatorOrg: memverge.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f38d0a8c-27cf-4825-79ee-08dafaaa64f0
X-MS-Exchange-CrossTenant-AuthSource: BN6PR17MB3121.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 05:51:37.2618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5c90cb59-37e7-4c81-9c07-00473d5fb682
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1E8TwyXJcuc7LtYE6m6YcHTM9p44KNrzck24gx3P0xoz7yCaIa74/fgrIQSN6qnoTmEKYe4PZqG9MFc7o1XPbCyu7Zr4BcDGZc1t56A9Dgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR17MB6190
Received-SPF: none client-ip=40.107.92.65;
 envelope-from=gregory.price@memverge.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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

On Thu, Jan 19, 2023 at 04:17:11PM +0000, Jonathan Cameron wrote:
> 
> Whilst I still have no idea if this is the same problem, I have identified
> what goes wrong if there is a module probe ordering issue.
> https://elixir.bootlin.com/linux/v6.2-rc4/source/drivers/cxl/core/pmem.c#L306
> 
> 	/*
> 	 * The two actions below arrange for @cxl_nvd to be deleted when either
> 	 * the top-level PMEM bridge goes down, or the endpoint device goes
> 	 * through ->remove().
> 	 */
> 	device_lock(&cxl_nvb->dev);
> 	if (cxl_nvb->dev.driver)
> 		rc = devm_add_action_or_reset(&cxl_nvb->dev, cxl_nvd_unregister,
> 					      cxl_nvd);
> 	else
> // bridge driver not loaded, so we hit this path.
> 		rc = -ENXIO;
> 	device_unlock(&cxl_nvb->dev);
> 
> 	if (rc)
> /// and this one
> 		goto err_alloc;
> 
> 	/* @cxlmd carries a reference on @cxl_nvb until cxlmd_release_nvdimm */
> 	return devm_add_action_or_reset(&cxlmd->dev, cxlmd_release_nvdimm, cxlmd);
> 
> err:
> 	put_device(dev);
> err_alloc:
> 	cxlmd->cxl_nvb = NULL;
> 	cxlmd->cxl_nvd = NULL;
> 	put_device(&cxl_nvb->dev);
> // whilst we scrub the pointers we don't actually get rid of the
> // cxl_nvd that we registered.  Hence later load of the driver tries to
> // attach to that and boom because we've scrubbed these pointers here.
> // A quick hack is to just call device_del(&cxl_nvd->dev) if rc = -ENXIO here.
> // There may well be a races though....
> 	return rc;
> }
> EXPORT_SYMBOL_NS_GPL(devm_cxl_add_nvdimm, CXL);
> 
> 
> Of course this "fix" just stops things blowing up, it doesn't leave things
> in a remotely useful state.  If it's triggered because someone
> is messing with the load order that's fine.  If the same issue
> is occurring for Gregory, not so much. 
> 
> Jonathan
> 

mild hint in the dev_cxl_add_nvdimm_bridge path

driver/cxl/acpi.c

static int cxl_acpi_probe(struct platform_device *pdev)
{
... snip ...
  if (IS_ENABLED(CONFIG_CXL_PMEM))
    rc = device_for_each_child(&root_port->dev, root_port,
             add_root_nvdimm_bridge);
  if (rc < 0)
    return rc;

  /* In case PCI is scanned before ACPI re-trigger memdev attach */
  cxl_bus_rescan();
  return 0;
}


if PCI is presently written in a way that it's expecting nvdimm_bridge
to be present (via acpi_probe), then clearly this would break.

From the other discussion here... that seems to be the issue?  If that's
an issue, I also imagine there are other parts that may be subject to
the same problem.


static int cxl_pmem_region_probe(struct device *dev)
{
  struct nd_mapping_desc mappings[CXL_DECODER_MAX_INTERLEAVE];
  struct cxl_pmem_region *cxlr_pmem = to_cxl_pmem_region(dev);
  struct cxl_region *cxlr = cxlr_pmem->cxlr;
  struct cxl_nvdimm_bridge *cxl_nvb = cxlr->cxl_nvb;


this may be unreachable due to prior stack traces, but you get the
point.

Reiterating my confusion a bit: I don't have an nvdimm, why am i getting
an nvdimm_bridge?  The reason it no longer appears to trigger on my
memexp example is because it doesnt go down this path:

static int cxl_mem_probe(struct device *dev)
{
... snip ...

  // resource size is 0 here due to type3dev->persistent_capacity=0
  if (resource_size(&cxlds->pmem_res) && IS_ENABLED(CONFIG_CXL_PMEM)) {
    rc = devm_cxl_add_nvdimm(cxlmd);
    if (rc == -ENODEV)
      dev_info(dev, "PMEM disabled by platform\n");
    else
      return rc;
  }
... snip ...
}

This seems like more than an ordering issue.

