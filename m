Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54170476F4C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:57:54 +0100 (CET)
Received: from localhost ([::1]:38922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoSP-0006KV-E0
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:57:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoQU-000581-Fy; Thu, 16 Dec 2021 05:55:54 -0500
Received: from mail-eopbgr130134.outbound.protection.outlook.com
 ([40.107.13.134]:11906 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoQS-0004eR-Vu; Thu, 16 Dec 2021 05:55:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1C5d03sB+dmoRvezxIf0PPG6c1uzZiN6G2a2oDzEvJPWS6ctP+WgrrO3LZPwDUTlEUScLVi0/7LKeHgHAvEKf7fLJ1shV2RRtRWf/AftU6pKXhFF9qEp5GNKu8Si9jGYg5NbV5X2ST2m9RXh5/mpCznEQHUnKtGnJOkVu80u9Up4tDocOnhhXjYp2PQzKRnZH9QdOc+SgjF2ReSLelGf5whzfYGYtQHOV0EJbFUNbf3KGtDdO3tsos7Vx2+uPGYEV1ENzx04z2Pp+ePF0uHJ/BqGxLdr0ZF5HSgDIGBr9fwC9kvfNeRpwupcf5Sb+zRPcHe7P2a+djFokWx8QWBpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMmSi7iMDzGWk7xiw0BA9f4xBXVSyMGAASt6NyPhnIU=;
 b=n8Dj+fMPPTPijq2sUjvWCuYXN6zgukk2JszzZgvE02QjmLyNdoeIDSKiYuj5p8SzNddRZvgIo5YyvL000C8M/+RsN9lldvuOlrD1HkI152sh+RWbWIk2XZO89NxfMnsO8HymTo6/e8l9KAwmS0zqGV2cEEgJtfqAr6epmTZnPp9zTHD1xBuRd3sVg9QrWNCbgNjwcXCIusY7ulbMsWYaYoLsXL+tmw0mHqF6z+inT0sNbID0YEh7T+LPJp2G/e4htujBN4C6iLLpxsanJodXotHEtbl0UvALP35wY0oMM1H/ZiSM8tZMOpo+NjRUG+uXhX9a66uifl3KUTRBAb6Zmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMmSi7iMDzGWk7xiw0BA9f4xBXVSyMGAASt6NyPhnIU=;
 b=knrRQwPjcHbgHGLTr67nlq0QNUBEhuItxRC3ekAdyLCIEIFH/KrSH+lxpzxfUMuizVGud48qV/XxiSKGLqriAtZZ0Y2VP84S2N8wG9ikuhUtoGsLBEBYyRCIpVta9pHK4durrFbXJC8VuzUUk7rL06iFfsnqtaDoF8sI3LO7F9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4067.eurprd08.prod.outlook.com (2603:10a6:208:130::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 10:55:50 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 10:55:50 +0000
Message-ID: <7352a582-1a18-f491-a0b0-906fe54aa9e4@virtuozzo.com>
Date: Thu, 16 Dec 2021 13:55:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 13/25] scripts/cpu-x86-uarch-abi: fix CLI parsing
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel Berrange <berrange@redhat.com>, Andrea Bolognani
 <abologna@redhat.com>, Wainer Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-14-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-14-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 10:55:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9194d8a-5930-446a-ebe6-08d9c0829f2c
X-MS-TrafficTypeDiagnostic: AM0PR08MB4067:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB406768E9EBAC7575B8E0414EC1779@AM0PR08MB4067.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sElL2QzRGe0/I1Fn2OXOrhIv35rvV7Ggmk0oS5lCYIBFvh3ZfcQMeujSeBowDe2fXUX+WhQFZ1cJl+w9Q9abZdjacTkE088T01v2+1pCiIdwfbI9YOqzJvOG5UmMHHGGbY91I0Yfu8KXvPbVqNB4PZCJiD6zFeUPDV9Aa5h6rLkeLvDWNQOuCG+ZOJ5eacI0uEnjhrZ6D8maIhD0Pn8RPteiWDOsH3AU+yzRoDzOmfapWfSHvlkuBVyWTmCINhF4Mytdw6sxWiMzVRFTbd3+eLe5T5zGksGDK4EXANBQMAMIRBrU8iMOko7yDbdk1BEYvY00GsHTEo62I4Y7YWoaM07O3w0Yn5j6HffuhNcgRlLdQoUEVC0E1i/aErjxnbiWP4IBV4ZTMvcRfHhxEt/saNp4oq0ALqGKDYcTN9F4nWw/493X/IAAMUSYOWrxLbvdidHfeIPg4Ccc7gRJzfFtUtueW8sHvDQhRP9V0epUkZWap07N8UeyU5u0wRaLYlwtb5S8E+9clcbcVhzjLvFWHTIBvDbsX6dewvR4UciO1IvTOvllWNBvmL35PV1Uds0HVaFPLQtChcRmsN1pJ+k+f1Z2SmcX1xGHt8sAaEyTHsRUF9jrwXFVRPpYO8r6Y/EzdQKVFjF0jaQAczXxM68O//QwkuMZr1xglXy75/G12fAG5MQw7A1jdPAh453K2AvN8hdrp/9PzzLCfPZcKwOOpIICDcaIH68QsmEMOavJtnaLjiTkovUkC9V/c290+gX92mJcwNvn6l81tveHVArgtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(8936002)(66476007)(66556008)(54906003)(5660300002)(8676002)(558084003)(86362001)(186003)(36756003)(956004)(7416002)(38100700002)(316002)(38350700002)(2906002)(2616005)(26005)(4326008)(508600001)(66946007)(6486002)(16576012)(31686004)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NStFdUN5eWFvc09sVnlrN0wrbktRVTRVNWR1Z3NBRUdGbE90K3hVS3BpQnhI?=
 =?utf-8?B?OHEzaWdvZi9zTzVhV0ZLSGFmTGtIdnhrTlh4Q2Vkc04xRFBVQWVnZDZSelFY?=
 =?utf-8?B?c0dpNDVjUThhbkZLUGJmeUFrdk16YUZPUVZzL2lvS1g2bEhkTkxxanFmSzlL?=
 =?utf-8?B?Um81N0hpbEVFQ21oOFhUeWtEOEtiKzkwa1RoZm9QYm1sbWNLbE9UUzRkVlVI?=
 =?utf-8?B?VFUwSThXek85MEdBQWQwS3ROMU8xVUxJR1BDNVZaR3JKemg0KzRSNlRVendD?=
 =?utf-8?B?Q09LRS9mSGlPUUV5N1EzYmdEVEhFSGt3MEZpSFIxaGZ5Y3Q2ZXl3OGFDY2hF?=
 =?utf-8?B?dHIrdkFhSjlpWGNrRjE3U2FBcGdDV0x0NHczeEZENm80YlUvcEs2SUV5bzQz?=
 =?utf-8?B?SGNPRit0clBHVlNFZ0RwZnhGSEFFbDBJQnorUkJ0Q3dJNkQyQUtMSHJURTEz?=
 =?utf-8?B?Z1l2bUFTYmlMeHQ0MXBlcFpOK0NDWDVWRVFTMlVMSWdkaStpdGlmZzI3V1I4?=
 =?utf-8?B?R3BmNjJnVlBwcHVOU3owYmxpTTMvOHF6Tk5xWnhETDVTWG5kcGJMMmtEbHpx?=
 =?utf-8?B?ZUpZT0JaTjduVlQ4L3FYc3RCczdjTG9jYmN1QjNiLzA4dTl5QkpnNVhFdmlp?=
 =?utf-8?B?cWpGRDZQbnQ5emFSQUsxek43UVNDNnNVMjFUQ3kzN0ZyeTVWbXpvOCtQWnlz?=
 =?utf-8?B?WjQ4V2dLcHlPV1JBZ01mYmRwRzZCbkJ6K3VMdElQUS8zNEJLRWFsS0dIWkxS?=
 =?utf-8?B?M0tnc1NYTXFoMjVQbnBCMXFERldxSFlHdjNta2JXaVN6RFFIYnZCaHA4bnpT?=
 =?utf-8?B?SEp4djhWdW1YdTBmazNPTUoyME5uUVgweWRMTmpDS1MzUWRubTdMcysyeXhI?=
 =?utf-8?B?N05uR3ZuTHI0WHcwTUxSUDhRWmVqZ2FGTXBNSjBtVzUxRkpCOUNkQXlFMHd6?=
 =?utf-8?B?cEtqTDlGKy9CZUdBZEQ1V3JNVTNOTzZESW1zdnlxQlR0bXNFbloxSXpxS0Fx?=
 =?utf-8?B?M3dueEQyZXFvY1dHU0dIYmNrU0xUVHBCOWJvczFmbExlVmRwYjFDcndPK2Zq?=
 =?utf-8?B?ZlJiNzNsZS94UXYxYVNEaUdwdWt1R2IxOWFrQ1UzcWUrc0t3YXVtS0dsZ05w?=
 =?utf-8?B?VFZMS0FTUlV4ajE2R3pFTVpJU2RzL2JxUzVEclgxUWZQOUljWjNmaHFRS3Zm?=
 =?utf-8?B?ZVhiYll6ZUZFVDFjVW1GN29QdHlFZTE1a280bStZTFdxL1pQcGVRVUhFdldn?=
 =?utf-8?B?ZGcyWTdVb0NwamVnS1V5OXRxcnZaVC9kQjhxdS9jVTZCaTliMFdhdUVucnZm?=
 =?utf-8?B?YVZIcVdyR2JUTEFJMnIxZ1M4VUVWamE1YmM0bXlGeGtRdGNUTzg1UVNXVDl6?=
 =?utf-8?B?RVR0YWVBdDVQdUo2eXg4Uk5tSGJ4c2piMm9qWmRVOFNyVHIwekcyQ2ZPcTZQ?=
 =?utf-8?B?RFM2WitZZEd1Q1VpSWswaFV6d1FJL3RpMUVONHhLVjJwb0dQRmhUd2ZwOHg3?=
 =?utf-8?B?ZzZaT2xLc1llaE9LSGVud1RKdEFSOGs5WGhYTy9mOWgyREFoYkVJb1pjZ29y?=
 =?utf-8?B?L1BicENBRWVTU1VBeVBxVnltUS9Sd2YyT0I1RFE4cnRueDE5QzM5enFDQjJk?=
 =?utf-8?B?NXdVQ1FIZmxvUzZtdWRaaW1jZUdVL0c5Qy9zRU96SThGc2k5QmdBcmp6Q2FP?=
 =?utf-8?B?MjFTOHVYckNsbDF0dnArcjhUNUcrNk43NHJZS001LzR5R1lBUkFDSHpmL2V1?=
 =?utf-8?B?WGJWWStCLzUvLzVubVVMUWxaOTZGNk5xUTVta3pmNm9xZ3NZMFdiMmFJWWJP?=
 =?utf-8?B?SXVwSEE1NGlqLzFnSDgwdFZrY25ibmlMMGxYUjVuUnR5aVBMWkI1dkpxTVJI?=
 =?utf-8?B?RUpITktxSTUxVlZXdGk5SS9WSDF2cFpuY3NyYlBLMFpDZ2ptNFBPNFZNVXBu?=
 =?utf-8?B?YnNlMWN0eFhlSWt4b1F6NUxpbGU5bklLNGxwRzR5SHFHWFhGbXhUdW9KVktG?=
 =?utf-8?B?NXdJejZidkV3cVJTdEVsYW10NjlMclZ4N2E3S082NkljWUVWUmdVQ3lxM0lu?=
 =?utf-8?B?eXhhZE9XZlg4YnFQa2NSbjFPUThKWkNzaWlWOEVseE9sSUovWHhFWStTZHg2?=
 =?utf-8?B?UGgzK3QyZ0VzU3ljSmRFWFRNYTFUak9JMm9FSTN5Q2tnMkcyK3Vja0Vsdmto?=
 =?utf-8?B?SXl1S1E5QjROWGpzYWNVOW1PbTlzSVRDMkFMV1c1Nkl6T2x3OFVaSzQxRERa?=
 =?utf-8?Q?hhbC3x6QV7IcNGWTMnE0Mm59qZp00EF4cG+TVAEiOg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9194d8a-5930-446a-ebe6-08d9c0829f2c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 10:55:49.9693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnAyTtnBo59XQnlQf5eF0+Pr6FlV3KAZVUCR77qvv24bnncy6EcH1St+1U+jgKxyQhvb+QjNwUMW/HBnTH7fjhenBh2utGXGKCfPUMQ3kAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4067
Received-SPF: pass client-ip=40.107.13.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_NONE=-0.0001,
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

15.12.2021 22:39, John Snow wrote:
> Signed-off-by: John Snow<jsnow@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

