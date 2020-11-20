Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0412BA95F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 12:42:31 +0100 (CET)
Received: from localhost ([::1]:37686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg4oA-0002BT-Sx
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 06:42:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kg4nF-0001kh-8J
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 06:41:33 -0500
Received: from mail-eopbgr150131.outbound.protection.outlook.com
 ([40.107.15.131]:61763 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kg4nC-0003jG-Bf
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 06:41:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krz50YbzYhBL+cFesEeWI5HOZlE3xp30b/5DKbN1ubGN2J6INjkLVg3d08hdCQZdu/Tk6MzrT1fgPP6TRaeLhVMdvnWl2BwQ6Fm1tpFxvK0bjHvqTKadx2i6uwOf37M1cBpsVddrsZgYTIdvETRtdRMnf/uNbSS9vDz5Av3rJ+Nioj2TKMuyXEL1zCARGXnWWP4hYSitKCyIT/9q8LgjpLMH90qCvs1Jr/7ohvAElQg3QTeMmWeUjsCCUn9m+F+l8gW1gULMxjDAGok3/9PNoRtrs60v3R0wwnNI1I9kDIi18QLIREAp1tQ3o+kO8cKWip39zQEbqiT7ch6cspWNrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcKX5G1YkxBVO46bUok/QZLnfPlsKSf3IlZDhqj05/0=;
 b=Q8juLBgh2TTAMlGzy4LdyPLeAP5X/u8syuM/7A7Hde+B0K5EqPN4giOijsvxF+NAChRgS3uvFbMlxODwOetpNhknfPzhUlY/mawd1Ps+8SjSj8ZTywD52ABmlZeED7RDfZMymjKEmx0i+E02LdLqXaHJeLpWcK+Jt2acGXwS9KH4kTpMdBUEk5Rf8UNMlK/GETirn9UBIN1tkic7zCDyBw5qS+tln63kRp02LwCb/6OMv8DS7YY0G8fmT4yQto7C5CIkOySdDcFuLfE0+4Cykm9M6okRS+W9m9IFPU+bETHBym3Zm7izBeL4tZWYsJP3X+cwgcbYenwFDrL36oDM0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcKX5G1YkxBVO46bUok/QZLnfPlsKSf3IlZDhqj05/0=;
 b=r7f/eTR0+1zkVt8HZFl8Pc1aOIA0SIkYdD7suxH1hA4twunEjvAh5WjixXHNVP4L31zM3VuTj+iFzlyu++igTsSBEi3jYYkwIKKrsgohTtb951OAoFM5CS2JJRQ15CsIIF8e5UkkEqRJrnihkBIw9JQjBDG0xkUyLEIMqJsDRRY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR08MB3069.eurprd08.prod.outlook.com
 (2603:10a6:803:45::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Fri, 20 Nov
 2020 11:41:25 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.020; Fri, 20 Nov 2020
 11:41:25 +0000
Subject: Re: [PATCH v3 4/7] implementation of write-tracking migration thread
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-5-andrey.gruzdev@virtuozzo.com>
 <20201119184727.GE6538@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <600d7372-fed6-da5a-4c5d-deaa4e6fd660@virtuozzo.com>
Date: Fri, 20 Nov 2020 14:41:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201119184727.GE6538@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR03CA0010.eurprd03.prod.outlook.com
 (2603:10a6:208:14::23) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR03CA0010.eurprd03.prod.outlook.com (2603:10a6:208:14::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 11:41:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14d97450-c9a4-4c9c-c77e-08d88d493621
X-MS-TrafficTypeDiagnostic: VI1PR08MB3069:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3069C44A89FAA943CA709FB69FFF0@VI1PR08MB3069.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DHscgCYeM3FBWaCziNZ8pXnrV1od3cFPMYoIY8auJEoQGBcgvp9+/OS5+fDRCwFG/LWV0okXc/otNFMxwOPOHu5fTJwomcfgqgFamvFPyZ0qS1DXanzNzde+ADyWUNZjdWmcA0nj2kl82Fb8XjjiBh0Xfpyl7mK6pYHFqV2WWsHGtN3Hjl0o2JqgHnufuC7uUT/z0FmA8RZLAV1xQYBqhPnFR1ykKm01HnfbfYaEpIvMtFy+Kho7Ns/4GOJ0KfPs0N9VocpphxLwbGBDw2tq6hziNrhC3pHUskFZenuUk0Xj3F3XRamHTflYR/qJsgqFRY7qRqjknu70WHrASX8OCgjTane9MbhYw3pbWIES0rEYI1tnSLDcppmwPUAbLvwG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39830400003)(396003)(366004)(136003)(5660300002)(4326008)(66476007)(316002)(66556008)(54906003)(83380400001)(6486002)(956004)(16526019)(53546011)(36756003)(8676002)(4744005)(26005)(16576012)(86362001)(66946007)(186003)(2616005)(31686004)(52116002)(8936002)(6916009)(2906002)(478600001)(44832011)(31696002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: gsq/4ehRw1FnzRHnkW2xUBBCwPO18fPVvO9OAhxtMgRd5Pvw/1oHIp0y9chV8Fk38QV7i3Tsqg1HbFlaQDjy0ey/a1FO0gggKtwC2VU1AZJRWxGPbIzaUdofrSd+zoShlU08K80+CB+qcOGlVkmZPBEq2y4EpRiURK4znmoOr4t3Hc6F29fS0givO8juYryTCIFhgk7BK+wDpTbH2Fs4/Ms/Wel3Z0RpMSHEcxw5+bIlEUCm9QKDia3Dze5IROkR5yGPnVaYdNknt+Eq+ljv/9qYAKmLJBhofKQYaABwp7XdaiU2+jqjtZzKojGIgEUo+ktsYI0SgU3DayTMETFKV+8FG6SLT00CntERBT+MXpY2dOpQnLy5kZKdSZXjDmZX93hucyVdsw4IzZRHHbvloXtd4LspGTR2fYWcwFOC1DQpafP5wqA7Vr7og08+27BK0XoFN2vyOfYhe0XfSybOQJ5g0b58BDIhZjGJoleXGTNGQRGlmvJceEeobr9G9FFtwOA47etWD85BeQ7rehxI57sqoXRlzvLZrYTdTE6DFQKwzWA5FHgWFj7c/gbgYiRGTFtE4FWDzWUoLC4nqoPPgabsyZR/tvPReFcKZ84qItcPYd24uSsjOBBaAaZ2/rSvMHvZC9IYNi7WdcsNsn3XbUEb/r6t14429JlTHs5q1Ybgl9rd1omre9PWUE9DXqXWSozkYJs7Wy3Dsm+WQUFzqis4b0pyHqMZSWLTotpNufw+ANKf9XtB0wsbA1wZI47XPpdjy36zdWX+iKQawFXg8KXoMAOq7FOQ/kImFu1UbjJCrj/BzAc/+bSukzou2BBCQcYFMYo1QKosKLspdKWHhhfk01eUuozx6EnOdwn2CkM47TZY1R9c1QjVwybQr2dcmgReP2qEhztLqQlg/PVqng==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d97450-c9a4-4c9c-c77e-08d88d493621
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 11:41:25.4956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8PC6XUaD+Kge+PVWg6YQbPpWHuXu3ftfXV+m0UVTVL9Ct+1TtAZSJ0sUG/5sF4tw5HAbZFo9x4/OlBs+9Fiowg9OupYUVZWG5SB0JNdlC2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3069
Received-SPF: pass client-ip=40.107.15.131;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

On 19.11.2020 21:47, Peter Xu wrote:
> On Thu, Nov 19, 2020 at 03:59:37PM +0300, Andrey Gruzdev via wrote:
>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> 
> Some commit message would always be appreciated...  Thanks,
> 

Yep, missed it..

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

