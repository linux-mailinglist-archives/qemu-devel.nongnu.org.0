Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEE850FB31
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 12:43:18 +0200 (CEST)
Received: from localhost ([::1]:38566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njIf7-0006gZ-KE
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 06:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1njHvI-0002NI-TR
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:55:59 -0400
Received: from mga05.intel.com ([192.55.52.43]:9527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1njHvF-0001q4-TU
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:55:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650966953; x=1682502953;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZgdYkFjvAysyymDxL9CwPmLVdCWYeLmB3pJEL2Y4uTQ=;
 b=M+EAmK4dc5JXuhqLBJsYpARIba/V9jmvmWFoW7zW/Vr3syTPdI/htUDt
 PT4RoVp6Rpeno0MDPCF5UM6/E1FSExnGUQZm/WFJ254B+KyjDrnZrrk9j
 LQyaV1Z8153yMzoiOhESBcEjUAUN+DH7MKdSB5NzijN5u/JvA/ijhxVsc
 B5jSZNsOGhoAHbZsxFpuwyyaPqW0oQBN06NwmbM1nps7ZszDkZs9oHhED
 O5X0qCVRf7whQQVBqxB+F4lDCvrYSMrUdY/zNXFH40V+K5hWyusvT9hv+
 hXp3Q2pkM9UrAiM3raZcOZvti9xeXNCLqSUoX19qL4WhEBnB4Zwplz8Jf w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="351967834"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="351967834"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 02:55:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="579804883"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 26 Apr 2022 02:55:49 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 02:55:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 02:55:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 02:55:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rz89DJTfyPozq2qQqULo9yJf3+vF5fDzNG1YHQwKmwNueYZdsae3n87BS+oGk+TrwtNsv+KmGobW2IvpKloIUgnUAQYj41r25bzA3atjmg/8gKSMSgj4L+iy+LwWSEv3sdSUYmG2AQyqGnJtsJatEEi2qAkB34ym+72036hNbJ51d9Ad+Je7sY8jv5MUoFG6NLIOXs8wJYkba76S/pc765ldC67LvV7INQsYa/JsqZy2BHcau+mmzUTBmQo1bObjI1EshJh+pmjwCSoqEZl7xOYQr/JXbx8rwMoCvPRW25xHgYrMXtUX42LBVkTMNFSlCelLuX1L5ivY3x0XtiUxTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/+1e90/c3bEz16OD4czNEwRGbVpZ5i7zIk/TuaU2z4=;
 b=nC9eHuzVqi5UgxYZPgLCi/qjNJMVWXyvI74ERWFrIe2+la8tL0P1IIn1E9oqmTfX4hzZswfawQEfgWcPayLcSCQGiDTx+ASaN2BooOScsw8Xnzwem6eIJKwU/LGdGvvjPzCFqAud9goe4DiiwdPXeuGJ//EHkV8iQRPPAh2d4cgDzV3I3gKAfKN/uN29uOeN+UjSL/ymV6OmiDkFxwrMs3regwYcL4MLQC+cy1oSaLSD7cIIEu2IBZtekruGSlu7PNG6DueZN8uzE+9MYThBs2YnG789y1PDqLGYBsWtXpPLl9ZJJM2+DBR3EiVpli/kNONlflURG21g5wUCUVZjQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM5PR11MB2044.namprd11.prod.outlook.com (2603:10b6:3:10::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 09:55:47 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::71d2:84f6:64e1:4024]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::71d2:84f6:64e1:4024%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 09:55:47 +0000
Message-ID: <3576770b-e4c2-cf11-da0c-821c55ab9902@intel.com>
Date: Tue, 26 Apr 2022 17:55:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
From: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [RFC 15/18] vfio/iommufd: Implement iommufd backend
To: "Tian, Kevin" <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <20220414104710.28534-16-yi.l.liu@intel.com>
 <20220422145815.GK2120790@nvidia.com>
Content-Language: en-US
In-Reply-To: <20220422145815.GK2120790@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR02CA0181.apcprd02.prod.outlook.com
 (2603:1096:201:21::17) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1196bd57-a986-49a9-86f7-08da276aefcf
X-MS-TrafficTypeDiagnostic: DM5PR11MB2044:EE_
X-Microsoft-Antispam-PRVS: <DM5PR11MB2044DDA32EE2E677D57FF4D1C3FB9@DM5PR11MB2044.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5lwwPFO664GvWlA+ElYJSQR/sntuIjnQ0LTdnoKulxoQDtvS22eSx070CEvn+Ba9C+pqFOVkB4vGIREMEn2maHp4IB+sNHEMkXRoZvuiBwgVaOvGHz+/hry5WqWHooJISnTXEr4Jo/SBB+3710uY4hE5esGkXgMe+5LPHo8aHW7PICexflnloqtPk+CcfFLiJbipDSkMIhG+l+mD8dbUxPQwgpjV4oWJXqheHcooz6n9KVwS1jRwu7Qzj5nUZgpdmfO8VF6psmkBqHsv3/4ujT1wk6KaBhidbXc40sj0HsL/EKT9bpL+1Y/0anFj4uboJEgyUtpuxhFH+JSwoph6WcvXlvf1hRih/cElUyYsNv2LysxrqYC71jTZ0Mrq9xRuLDJVYoqVsyc6dwLhlMTXfVWQtuFcObKK46ZN9omA06mL5Vrk47LJtSEA/Kp9GU7vSN31/JFtas9L3TNnaKqw9tKN1997gTZq6560Ru4V07/KkDrbk6nYf64sxJT5KFv3SjgvjBhhxbA7eWmyg4nQSHSjo4X2kQhsC5vL0vd/TgO2K42KU5UsAHPHsK2xRnTyUfnOvKspseDmsiLZgbtaL8/Gm4x07rj3sZblocK25BVtCh0ALT8tb7uHsLBev7kD7RPJlpDTDfivuB3IKEDqApVRFr28SYiEopDDtETGQd/vs0tgjd8m4N/10qZrT5p60qrTArudbBUT9IyWX8O+HGkrYv5OmZcEeQGJttczuQ35oOU+tsd1R6EcAUsSHUFX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5658.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(66476007)(5660300002)(86362001)(316002)(2616005)(53546011)(7416002)(82960400001)(38100700002)(6666004)(83380400001)(2906002)(8676002)(66556008)(6512007)(66946007)(6506007)(4326008)(8936002)(26005)(186003)(110136005)(54906003)(508600001)(6486002)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzlRVkFxYzI4ZnU0ekJuQ2xFL1J6emR2cFk0YStKTTB1RTdLRzltcEEvUVYw?=
 =?utf-8?B?dWZDSGhQTVdhaldONEtZU3pWajliR0tubmgxNmM0anA1U1d6MGdiNXNQNFZm?=
 =?utf-8?B?MW9PS2twRFpHWEpXa2RLT3VIa3QwR2dNRTVuQm5STnhaQTNGNVRuQ1RPY1ls?=
 =?utf-8?B?SEFGeWJVdnVndEI5ZWI4QXhVaWtyOU9HT001dStVWnkvZWUxMGcwOVRPRUxO?=
 =?utf-8?B?UlJBME5nYmxqdTNOUXl4VHpJNlVlT2I5a2JpMElJZDZPbE1rS3RVM3kxdEJP?=
 =?utf-8?B?bTRjRlRBT0ZNcWFoOWpyUVk5S1JXR0psVUZ6dGhLVXpETGh6M096RSt4L3Br?=
 =?utf-8?B?S3k4dzRwOUdhKzBwcVYrWkt1YlBOejdwL2dhTEpXWXMycHppcW1sSWFWS1BN?=
 =?utf-8?B?M0dML2VQaHZmbjJ5ZUJsWE9rdmZiL1hsMitiR1lMSkxBTElYUjFQRGFmQnBJ?=
 =?utf-8?B?bE1vYm9tTXBTVWxRUUlHdm5TelZiWG9RR3ozRE44dDBNaGltMGNPL0xLYjF5?=
 =?utf-8?B?YW9qY3NUazYrNSt5MlM5ZnhlaE1DTDNTMTVwRnFQL3Y5L0Y3a0hRcEdXYmFW?=
 =?utf-8?B?QnRwMldkVEFWVHk3WFFJQkdOUXZHY2g5UlExcWdqUlhUS2R1NmxnTU1CRk1D?=
 =?utf-8?B?VElndWVlN1ZuZEkzeTVxbDlMd0F4KzkrQTNmcEpjazhsNWs5UWNrYkRpOHZL?=
 =?utf-8?B?bHZIK2JlMHk3b3hHdGp0eTd1eFkzNE1Ca1dXMFpVcmFEV1BYb2J6U3VtN0F5?=
 =?utf-8?B?dnJEWS85S0VSdkdERlcraExHSHlSckJkeENJcmcyOXA4aUlUQW1UaFQzVllo?=
 =?utf-8?B?ejdVQ2FINExBRk8yR3RuS1BCWXk3MDdyWHZJbHA5VmVnOCtiR3l0RXcyQk0x?=
 =?utf-8?B?M3JoMmw1WGduQXdMZ2hxUEtKSDVLOENoRU9qK2g1M0wxMmpHNDRucDlwR0lH?=
 =?utf-8?B?ekRRNW9OMGlpSVo0QjF2UjcvV1VEdGFGMnA2U2w0MHkzNWoxNXBLWFU1RUJX?=
 =?utf-8?B?VmttczhaVEI4Y0drNlhjUFVKSmdYaWZmdGdPQXhZMytVdWZRUW50M29EWUlx?=
 =?utf-8?B?Uldzb2l6Z2R2SXF3aDh6Sm0zaDlucnNkRS9sSzNHbVpwdzBjTTdtNUllQkdz?=
 =?utf-8?B?TGFIdDBKUDdDYTRBR0V3LzRTNmpOU3IyY0d4bVlCRWlEWUlCSUpxU0t5TVhG?=
 =?utf-8?B?VTlzdGNVM1R4R1NMQmdtSWYxRVlaVzZMbEMwQmtHU1UwZm9ZcWltMmhic2dh?=
 =?utf-8?B?cVlQTU8wQ3RFalM5ZXphU09aTDNkSUVvdHZZRTU2dTY4TXhVOU9rVU5zSXNo?=
 =?utf-8?B?aDZpTmR3SDlhakJXMDVWZW5UbHlsdlhYMXM4QzhxS1JybmZxWHdPRmY4UE5M?=
 =?utf-8?B?R09NVjBJbUpDWElITHVmT0xSWEY3V3ZZcXdZYW5lZXNnekwvamlyOWJla2pO?=
 =?utf-8?B?d2FqQ0R6c3RieXFxUnpOMnl5djAycG1ZWUVkTVFJKzN2WlFSQnhsc3lwRGNE?=
 =?utf-8?B?a1BxU1BDeWlnRGJVbGRqNDFha0hFVzFsL0lKVWRqWEFlZlViNndnb2RrQ0JW?=
 =?utf-8?B?QTRZbzYzMzhBSkxVaXFEZ0sza3JzWmROazRJZ2JJL29MZFVORDgwOWluTE5j?=
 =?utf-8?B?L05rRFkwejhpdEtOK05lUXV5V0pIRFQ2cnRZa3UxK2RDcWx4Rzcwb2VjaGJw?=
 =?utf-8?B?WS8zSjdncW83NjBUVXBraE9QMFlZU01OUEc1Nkp0YzNMdjF0ZHVQMEpYejVm?=
 =?utf-8?B?VkFzVmlmR252Z3E5WWVDVWFpUU5zQWZIbE94a1hrSXNLOGFXTW4wZUk0bi9z?=
 =?utf-8?B?eHFXZ3owL2dNWVkrTm8vd3REYzlURTVTNStaQ1dzeDVadlRoRjQvTnI1aVRQ?=
 =?utf-8?B?QnkzdWUyM25qcTZKNXdZUjR3aW0yS0NpaWs2UlBVeDhYV04yY1NGN1paZTVl?=
 =?utf-8?B?bmd3TmZ5WGx4R0R5RExFVU14S1pGdk0xZnQ3aEVudkNnZitFOXQ5OFp4ZExI?=
 =?utf-8?B?bGJmYkZnTjJYdmpnMmdhWWdXYXI1aUF3L1RuYTlrSTQ4NXN3aUFXQVg1S1I5?=
 =?utf-8?B?YjBUdllkdTA1ZllvYzhTRWpFUnVLVXZPdTJMbmN3MlZFbGlyVTRwUnRRUGRS?=
 =?utf-8?B?d0EyZi9BbUVCSG5RUlJaMW9FNm1tRzNtbStjd0RpeXBZaG5NckxXZW52SzIz?=
 =?utf-8?B?S0I2bHcrUHczbms5dmhmRStsUHhnY3UrbWptK0ZyMmRFYWEyckxUOTZ1ajRn?=
 =?utf-8?B?RldsMzhYeFN1T1NSaEhoaXMybWcvTVdYSUs2ejhyeTVjZTNIbDZzRDJOVlJG?=
 =?utf-8?B?R0RUcWNKY1g2ejNzejJWSXRpZEZhNUdtNno5Smo1bDBFeFN0V0s5Z29ROXd0?=
 =?utf-8?Q?gx8aV+Cef1YuILeo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1196bd57-a986-49a9-86f7-08da276aefcf
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 09:55:47.1749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ELvIkpWXpHcrSnh7QgmS5MWNp6w0ExdKyOhSDKZrhAcyLLJONLnE5SrjSnGSfr1o7PhfoAToSzxc90/EUcZatA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2044
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yi.l.liu@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "Peng, Chao
 P" <chao.p.peng@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>, "Sun,
 Yi Y" <yi.y.sun@intel.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Tian,
 Kevin" <kevin.tian@intel.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,

On 2022/4/22 22:58, Jason Gunthorpe wrote:
> On Thu, Apr 14, 2022 at 03:47:07AM -0700, Yi Liu wrote:
> 
>> +static int vfio_get_devicefd(const char *sysfs_path, Error **errp)
>> +{
>> +    long int vfio_id = -1, ret = -ENOTTY;
>> +    char *path, *tmp = NULL;
>> +    DIR *dir;
>> +    struct dirent *dent;
>> +    struct stat st;
>> +    gchar *contents;
>> +    gsize length;
>> +    int major, minor;
>> +    dev_t vfio_devt;
>> +
>> +    path = g_strdup_printf("%s/vfio-device", sysfs_path);
>> +    if (stat(path, &st) < 0) {
>> +        error_setg_errno(errp, errno, "no such host device");
>> +        goto out;
>> +    }
>> +
>> +    dir = opendir(path);
>> +    if (!dir) {
>> +        error_setg_errno(errp, errno, "couldn't open dirrectory %s", path);
>> +        goto out;
>> +    }
>> +
>> +    while ((dent = readdir(dir))) {
>> +        const char *end_name;
>> +
>> +        if (!strncmp(dent->d_name, "vfio", 4)) {
>> +            ret = qemu_strtol(dent->d_name + 4, &end_name, 10, &vfio_id);
>> +            if (ret) {
>> +                error_setg(errp, "suspicious vfio* file in %s", path);
>> +                goto out;
>> +            }
> 
> Userspace shouldn't explode if there are different files here down the
> road. Just search for the first match of vfio\d+ and there is no need
> to parse out the vfio_id from the string. Only fail if no match is
> found.
> 
>> +    tmp = g_strdup_printf("/dev/vfio/devices/vfio%ld", vfio_id);
>> +    if (stat(tmp, &st) < 0) {
>> +        error_setg_errno(errp, errno, "no such vfio device");
>> +        goto out;
>> +    }
> 
> And simply pass the string directly here, no need to parse out
> vfio_id.

got above suggestion.

> I also suggest falling back to using "/dev/char/%u:%u" if the above
> does not exist which prevents "vfio/devices/vfio" from turning into
> ABI.

do you mean there is no matched file under /dev/vfio/devices/? Is this
possible?

> 
> It would be a good idea to make a general open_cdev function that does
> all this work once the sysfs is found and cdev read out of it, all the
> other vfio places can use it too.

hmmm, it's good to have a general open_cdev() function. But I guess this
is the only place in VFIO to open the device cdev. Do you mean the vdpa
stuffes?

>> +static int iommufd_attach_device(VFIODevice *vbasedev, AddressSpace *as,
>> +                                 Error **errp)
>> +{
>> +    VFIOContainer *bcontainer;
>> +    VFIOIOMMUFDContainer *container;
>> +    VFIOAddressSpace *space;
>> +    struct vfio_device_info dev_info = { .argsz = sizeof(dev_info) };
>> +    int ret, devfd, iommufd;
>> +    uint32_t ioas_id;
>> +    Error *err = NULL;
>> +
>> +    devfd = vfio_get_devicefd(vbasedev->sysfsdev, errp);
>> +    if (devfd < 0) {
>> +        return devfd;
>> +    }
>> +    vbasedev->fd = devfd;
>> +
>> +    space = vfio_get_address_space(as);
>> +
>> +    /* try to attach to an existing container in this space */
>> +    QLIST_FOREACH(bcontainer, &space->containers, next) {
>> +        if (!object_dynamic_cast(OBJECT(bcontainer),
>> +                                 TYPE_VFIO_IOMMUFD_CONTAINER)) {
>> +            continue;
>> +        }
>> +        container = container_of(bcontainer, VFIOIOMMUFDContainer, obj);
>> +        if (vfio_device_attach_container(vbasedev, container, &err)) {
>> +            const char *msg = error_get_pretty(err);
>> +
>> +            trace_vfio_iommufd_fail_attach_existing_container(msg);
>> +            error_free(err);
>> +            err = NULL;
>> +        } else {
>> +            ret = vfio_ram_block_discard_disable(true);
>> +            if (ret) {
>> +                vfio_device_detach_container(vbasedev, container, &err);
>> +                error_propagate(errp, err);
>> +                vfio_put_address_space(space);
>> +                close(vbasedev->fd);
>> +                error_prepend(errp,
>> +                              "Cannot set discarding of RAM broken (%d)", ret);
>> +                return ret;
>> +            }
>> +            goto out;
>> +        }
>> +    }
> 
> ?? this logic shouldn't be necessary, a single ioas always supports
> all devices, userspace should never need to juggle multiple ioas's
> unless it wants to have different address maps.

legacy vfio container needs to allocate multiple containers in some cases.
Say a device is attached to a container and some iova were mapped on this
container. When trying to attach another device to this container, it will
be failed in case of conflicts between the mapped DMA mappings and the
reserved iovas of the another device. For such case, legacy vfio chooses to
create a new container and attach the group to this new container. Hotlplug
is a typical case of such scenario.

I think current iommufd also needs such choice. The reserved_iova and 
mapped iova area are tracked in io_pagetable, and this structure is 
per-IOAS. So if there is conflict between mapped iova areas of an IOAS and
the reserved_iova of a device that is going to be attached to IOAS, the
attachment would be failed. To be working, QEMU needs to create another
IOAS and attach the device to new IOAS as well.

struct io_pagetable {
          struct rw_semaphore domains_rwsem;
          struct xarray domains;
          unsigned int next_domain_id;

          struct rw_semaphore iova_rwsem;
          struct rb_root_cached area_itree;
          struct rb_root_cached reserved_iova_itree;
          unsigned long iova_alignment;
};

struct iommufd_ioas {
          struct iommufd_object obj;
          struct io_pagetable iopt;
          struct mutex mutex;
          struct list_head auto_domains;
};

> Something I would like to see confirmed here in qemu is that qemu can
> track the hw pagetable id for each device it binds because we will
> need that later to do dirty tracking and other things.

we have tracked the hwpt_id. :-)

>> +    /*
>> +     * TODO: for now iommufd BE is on par with vfio iommu type1, so it's
>> +     * fine to add the whole range as window. For SPAPR, below code
>> +     * should be updated.
>> +     */
>> +    vfio_host_win_add(bcontainer, 0, (hwaddr)-1, 4096);
> 
> ? Not sure what this is, but I don't expect any changes for SPAPR
> someday IOMMU_IOAS_IOVA_RANGES should be able to accurately report its
> configuration.
> 
> I don't see IOMMU_IOAS_IOVA_RANGES called at all, that seems like a
> problem..
> 
> (and note that IOVA_RANGES changes with every device attached to the IOAS)
> 
> Jason

-- 
Regards,
Yi Liu

