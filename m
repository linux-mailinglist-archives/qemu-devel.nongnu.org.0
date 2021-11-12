Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4A244EC6D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 19:06:41 +0100 (CET)
Received: from localhost ([::1]:40048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlawh-0007jE-Kd
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 13:06:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mlauV-0006op-Qh; Fri, 12 Nov 2021 13:04:23 -0500
Received: from mail-db8eur05on2127.outbound.protection.outlook.com
 ([40.107.20.127]:58853 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mlauS-00059G-65; Fri, 12 Nov 2021 13:04:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3cBvtb6QsI9GY43C9gtlzE4A1nIWMHxyTjKvZV09/U+WTDPtf0PZccuXGVNmt+Y53iFH+yhvD5A1kZHgB9ePAOAzXWg4xpbe0LEM3q/v01sxDIkBqT1sPdN96ZMoe4/+gZk6H0sW/iGHw4M1+B0ilUYk+V8r+bj971OfIi5j+rIeOjXHiKDOMqRKxdQ9+HJCj8wfscEOhNqoZRV278Tb6i9mDRWj7O/of0Mx+sTZEkIz9TAOP/MUAfWLlRZoDSIp1Edd0JvdsIlm3FTrmNCuq82+U+8LGEj/FcGTp+f4KfRlfWl2R5zqSFfuE0b36DBWCrtDCGQV5S/ENWlPmQXig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=321JuUyu6KrcL5c8SpcuvVaOsZLik7mQXvXZH7LTA8Q=;
 b=YDe4szDxkGlXvMYPHyb+wHysrjKSpKx9tsnoCdOUVvfLJyZppgTtcApFZErI3TIv0jKkbgo4r9PNgjtieMsVARcFT1JjC8OeFGfhcyjB0a1wsVNofm+UiV8eVrh/6dreYRo8pG8jueT5ifGgQJ2lmhS0ua7NJ1JV8CPZOLPyHnUQluB7a7QiUyjJbOHIyVz/yv8IGtLaa/M8EE6SXiYc2vihu78Ybx3Gp1/J5Te4irftUMcrFze2B/f6wxC3moxEkk2gRB7iCgPR0TZkJiXGEzsUdLvAj3MGTXiaVVQaXFFkInYz8nqu+kr+LmeessxxK0SQF6PJqPv4WcrodqaL2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=321JuUyu6KrcL5c8SpcuvVaOsZLik7mQXvXZH7LTA8Q=;
 b=dz5EAmIhyDr367Aj7q+5OtjM2RZs0zZPFdOQP9euinlmhCa2L3ljWsTIMnnNsPQrhr/ANoBp08i3kC2fL6ZrJb8KjwMf6p4f/SVCZwG5cQPiOme1KxIJNilME8KH7jMnMHar/jenx0JBSidAp33JilVIrVXjJ5VmPpKdXuZy8XE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3575.eurprd08.prod.outlook.com (2603:10a6:20b:48::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 12 Nov
 2021 18:04:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4690.018; Fri, 12 Nov 2021
 18:04:15 +0000
Message-ID: <363f6749-90c6-9336-d013-ede3a35df5bf@virtuozzo.com>
Date: Fri, 12 Nov 2021 21:04:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v1] job.c: add missing notifier initialization
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20211103162155.791482-1-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211103162155.791482-1-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0101CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.229) by
 AM5PR0101CA0013.eurprd01.prod.exchangelabs.com (2603:10a6:206:16::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Fri, 12 Nov 2021 18:04:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61f25bde-9bd1-4b99-fb54-08d9a606d70f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3575:
X-Microsoft-Antispam-PRVS: <AM6PR08MB35757B4C69253B39E728795DC1959@AM6PR08MB3575.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KFvVyU73zPZxTO8MIYpNx8vGCuILaPj/tFNsAX34eVkiYSm9EyZ2T0vVHQ+H7HVT2Oz42uDyY0gDPv+QvD5Gz1Bn4GluiCSnwrmJOq4HHhT72Sua8kQhUByD3PZxatcEECvrdB+v61etpDTsmQWMZk3Z4HvaEvQz8IqX+vmYQTkxOaSI9WNM/dWu66dDcU7dJIA6cg2vE+JvtAXnm74MeO/RG5Q5xHPUmt/EJpfulOooElDIe6PTVEozIn0VCmvIQe2AHWuw/+2hbdDQwyzY+PgSbJZ9QhgixxWzqjSwd59RxUEwS5i82/6kHsoCz7Nzd8WEjtVTUhf/FNkfa2PbsO/ncbqCEDBVrRNYdX6ZjbRePvxXoF13r48MMUtmXfdWhLqSDgWUTciUugjHlGyHdaYDrxc1lsYfprTQuVwudKWZJj06Qqsuu9cevA0SKFiAG7NZDu3+PcwunXmhBDZz1pXEKlfW9EF48mTL51gaVXA2CEoVBUaVZ2nV/ZwZNFKtDc/18ahp0sRDvsmsI4V0Ye4ND0cAWSIPhXIMzZpUqQitxdIs+1CMh1yYCUze8SJPMifoBbEEHRyeu3jBVLP72P3hd2qxPThWvvEpkRHvCDcWJ4+EvdMq73noiWs89Ts8JCs3VItF9XnM8/2RaVaj1VjGTyOj14w+h8etHTvPe19Ejua6RhTljHmVYFNrqUQfj4Ra/d1rDzYasUeILwV6AqITFYrK5BamnF4JzwKX7YrgoMPCJNmnxffw4kxPJSPG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(2616005)(5660300002)(508600001)(186003)(956004)(26005)(83380400001)(36756003)(66476007)(6486002)(8676002)(8936002)(31686004)(316002)(38100700002)(66556008)(54906003)(86362001)(38350700002)(2906002)(16576012)(4326008)(66946007)(31696002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHl2RGZHaUtLa1A4dWM2Nm5kS1JmZkpyZ2xpaUxEbStuZWZqS1hMN0ZqYUhs?=
 =?utf-8?B?ZVdGZUpjOUVWQ3o3d2dJck5CckdJN1lyUmY4Witsc3FGZkY4YTYveDZuNTA2?=
 =?utf-8?B?N245ZmE4Qk4xTlRXNk9Ea2d0OVMvZmVpQ25keE1OQmFPdUY0NVVYdzQ2Vytz?=
 =?utf-8?B?a0JmbTh6K1VwWWF4TVowZ2l4RzgrUHMxKzUyM0lnYmRxRlFVcTgwUGdwU0p4?=
 =?utf-8?B?OTdnWm1BZ2dFamJRYzZEUjI2bGJnOWIwbnFvT2J3UGlLOFcydUR6TDV4ZmFC?=
 =?utf-8?B?dlp0UzJpM1VoMFFCZldxc2VhVUdCUHkrRUtZQW5ReFQ2Y0ZPZnh4MVY1bnRt?=
 =?utf-8?B?anNueHh3OVNucW5xdWZ3YjNBN1ZyR0ZvK0N6cEROdGl4U3NWb3ZwUGpJQ0Ir?=
 =?utf-8?B?R2l1RHV6eWVkOFd0dGR0Rk40QVczYmRkY1gwc3hIMEZ5UFNFaysrc3oxMUNI?=
 =?utf-8?B?QTV4WEtiNUJOdWo5Z2lzaHVTRnVKSGpBVjIrdGl0aG1kN2hGT2xLbXN2SXNM?=
 =?utf-8?B?TC9neVl0cG5SVkMyMHNaR2lNejJRYlEwNU9mSk1xNGRqcWhXVzZDYjdwdUxY?=
 =?utf-8?B?c1lwRkxFRW5SbnhJQUtNWDhaTGQ0UFYybzNubVg1Y3QwcXRILzYrQlMrSEFa?=
 =?utf-8?B?bW9tL1ByRFRqOTU3OXg4TTBDdEEyQ1lVbExUSjYycHBCUUhYeFNUNVgrQXls?=
 =?utf-8?B?eWVYNnNBVFNBc24vMEJZSStIZVZVbkNWWWJmSkthWEt1TmpYeVBsZDdNeDhr?=
 =?utf-8?B?TWs5WllnQjNBSmlKRE5lSWNUL2VxMGd2MjF2MGFoVWtDb1M0OVUvQVhFNk5J?=
 =?utf-8?B?eW9UckNoSUhrWDAyU1NMUmprcmg2dWUzb0JxWExwYzlyZklCUjRGTkh1Snh6?=
 =?utf-8?B?RitjT0pSSUVMZCs3QTU1RW4xN05IRDNPS2tLS1NFQ3FmVyswMmdiM0Q2b2cz?=
 =?utf-8?B?WFpJZWQrcGNmSks5RmlMQWtMU0pGbVUrcmhqN3Q5M1Byc2NDSHBrdS9CVzBM?=
 =?utf-8?B?dWFHVEhFZXdqVnd6bTdMWlplRmxZS1FQYW0vRjFzeWNQcDhLVHFlM3Z5SDBs?=
 =?utf-8?B?NUlzQVhtbnRiQ2RHdE84OERtK3VZOWxCQUtPcldOTTVtMi93N2tJbVR5UjFj?=
 =?utf-8?B?V01nbWYyN1FyUlFmVkxoYmhjWnhpU1lHMkZYWWdhaEFVd2txNXZnVkM4TVhQ?=
 =?utf-8?B?UDIvZ2JtcE1MTHlWR2tjQTBjRGVBSTc4ZmxhNlBtbjRDOThmejZaMXVLMjht?=
 =?utf-8?B?SUtWczFhM1E2ZFpiNGExWGM2N29ucmpQdlZzNE14VFNtRjAzM1YvYkE2V2hy?=
 =?utf-8?B?YUNWcytGbFpuUVVsK2FoSUlDVzd1YjhSNy9JdkR2K2dxd0xyM1YvckU3SGg2?=
 =?utf-8?B?em1xaWZHK1JJYlFPV0tFUzA0U2dnSmhnNDNTYytDZkRTbzR2dEJEZGlZejVh?=
 =?utf-8?B?bWkvYnpkMkRKaUYwNmxzbllzdTl0eUdkMWhrREVBdHlwUXhuWjdMREFBZ2cx?=
 =?utf-8?B?MVRHdVAyVk5LL05sQUs3Z3RqR01Jc2NrWWlOL09zd21RM0FpdXRsdU9PYjVi?=
 =?utf-8?B?bkJMNElEb2pSQzhhaU9WczJKNVFuOS8ra3NiZVp1dkdnTlFlL0I0QUJVNkpT?=
 =?utf-8?B?NjlMVC9Lc2pMR1dyNE81MHBTOGRPZ2xpV2JYcXZnZitjckV4Rm1SSnRyWkNB?=
 =?utf-8?B?L0pQd2twU1Y4SlpadCs0TTk2c0JaQnc3R21rT0FXMTEyUmxOc1AySDhZc3ZW?=
 =?utf-8?B?d2ZlbHRuWC9sOUFFZytWUWxaSi9iazhhSllwVXI2TU5leStub0RQaytmcFdS?=
 =?utf-8?B?a3lPS2VIMk0ycFZPSDBicyt3eElkVUZDeFN3d1hhdVJKZTlFbFlha3ZZeEQz?=
 =?utf-8?B?b1J2dmZGR3BNd284Tk83L3M3MVhyOTJFVmIxaWRmRXQ2QVRWQVpHRXZNbzhV?=
 =?utf-8?B?US8rZm5LbmpOcmdnc2xBOFNIT1ltck4vRlR6SjBuVG9XUzFPcGFuUE92S0ZQ?=
 =?utf-8?B?bnVtL1d1SmQrdG0yV0FTK0lCZkMxN29MUDJ5MVBnMmhlR2c0V2pYeExCUTdi?=
 =?utf-8?B?R0Z6L2pYMXM5bGQxZGNXM1hsTFVhQkliMnkwTGErMUJLK21nb3NteEJEREZS?=
 =?utf-8?B?aGlrZUs3aU94RzZNM1JkcjYvaXZ6L1Y3S0FwZ1p5NTZVT3NFT0g3b1hLWXBk?=
 =?utf-8?B?dW10R3Z6RVdydDFZbXFyR1dXODhIWEVGcFJhQ1JHYzJEMTh0STFSeUJ6WWs5?=
 =?utf-8?Q?6rQ/HD5EcknbgNPquVqRnCIoeSvPdnVbI5KqJv+6Zk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f25bde-9bd1-4b99-fb54-08d9a606d70f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 18:04:15.8545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5vhB/hYl/iJlR7/J3tolOgwfkEUjOUc4Fir/86LzL5hdR5mWw+XphAHkFRZecN/VOS1rLVp3JmHcb9WLaLdV9n9wmyL7qmeugOzPV+wTHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3575
Received-SPF: pass client-ip=40.107.20.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

03.11.2021 19:21, Emanuele Giuseppe Esposito wrote:
> It seems that on_idle list is not properly initialized like
> the other notifiers.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   job.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/job.c b/job.c
> index dbfa67bb0a..54db80df66 100644
> --- a/job.c
> +++ b/job.c
> @@ -352,6 +352,7 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
>       notifier_list_init(&job->on_finalize_completed);
>       notifier_list_init(&job->on_pending);
>       notifier_list_init(&job->on_ready);
> +    notifier_list_init(&job->on_idle);
>   
>       job_state_transition(job, JOB_STATUS_CREATED);
>       aio_timer_init(qemu_get_aio_context(), &job->sleep_timer,
> 

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


I don't think it worth applying it now:

job object is alloced with g_malloc0, so job->on_idle is initialized to zero.

notifier_list_init() simply calls QLIST_INIT(), which initializes the only field of QLIST structure to NULL. So, actually these notifier_list_init() calls are no-op in this context.

I queue it in jobs branch, but will not send a pull request until more critical fix comes for 6.2 or 6.3 development starts.

Thanks!

-- 
Best regards,
Vladimir

