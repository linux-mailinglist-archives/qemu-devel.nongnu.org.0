Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7972EEB78
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 03:51:28 +0100 (CET)
Received: from localhost ([::1]:56058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxhs7-0004t0-Nq
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 21:51:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxhqs-0004K9-Nx
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 21:50:10 -0500
Received: from mail-oln040092254095.outbound.protection.outlook.com
 ([40.92.254.95]:4288 helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxhqp-0004tt-DI
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 21:50:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCMCddGqDEjypruIXzvk7zDWYHweZBjqVY3mdWCn/+VEsenJEkB4PTazi4u+1puhsUINXnnRZK4H5lV2dAsytpOIDekb6t/4lud+SEexOc+NNMBW9+Qd02TlyQvizKAPFk6EaNGfiHi24L8j2kIOlBafo1IpeRgr8Mc04Yk0O9W6GYgAfaRvohWAAV9LOiOg4HSSq/u3ib2XM6rqavBMty9azX/QfdahBkZcsb1CAL+XBgOBn9dCFEtPM2+5lIVB0rrhnoz7501h3pJRTud2DaGMLhz0tCqXxz7BfO+JJySchhHXMvoez63kD+LtOrSJrWEcVYD73GAsLVFBf+OU3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WS1dJHurr/wXRO6MK6FMm/WykXcTbOhmor8zOPzVA9E=;
 b=k3cGo7qCMtX1FIY65TPQcFlPFne4vNq3anUbORtZsHQIJMt0BsjrlR4SwydHeqAs6vzAEOud6wl4MdiLchRQKnGVz/0keCAlB68wiH5/neFa0xf6c4DuKLSzRxeFfN45XEh79RbS2qfYoX9ex9V50Ebo3Yo2xvk75Xpw+nvwHbZAX+hV/CXkIMuwDVH8BGOcSbTu4DOszrZEUmbIJQqhMh9xzTmVDAoGUJ8IQYoN+8CdhvLkzcSXuRe94gJqw8CEWfM1wIKbd3oCByh3rmAsufbnYMamqfQvDJGwwyXraDA7VdW+hPmkVLUn8sm5LrE1UXY5JmctYD2582SMU0yD9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WS1dJHurr/wXRO6MK6FMm/WykXcTbOhmor8zOPzVA9E=;
 b=ktuTdPdDkkgrECeN9123z7mx8Oejeux8Ivuk65uXkX5x8wkFEKlWrt9fhzs+UR8XM7qTvpGQfeuPCC+eQ2EbEf3orj2lD+nLmJKNE/p/nU6izK9SkK0kaFvrNFtC+nACRTP4nNZmmA8fJsX9PblNA/vgXAEjhabYEpxf6i7Wc4WafJD6NoAmwvE/rhF/MvpiF43afNDGjBQX6a0qyWAH4yvcYWYCCZgse3D9iX8bZXN+SJnyoebrRRKJitFAX58K9hPNCxax6FibrAslOperEQtVjwFm5ht8oKjN/j0J/eqtZsGO3osh/W8cmfHHOp67DeGS4dWpOMwOgxxGA/6IgQ==
Received: from HK2APC01FT029.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::48) by
 HK2APC01HT068.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::471)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 02:50:02 +0000
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebc::4b) by HK2APC01FT029.mail.protection.outlook.com
 (2a01:111:e400:7ebc::195) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24 via Frontend
 Transport; Fri, 8 Jan 2021 02:50:02 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:D7134C75F9798B3DB47BE047B0004487F25EC6125F1A0B287F5B874CB1D6B6AF;
 UpperCasedChecksum:9AF1D4C32B779D135179E7C4245166056151E176E6BA907057407A579F65AB20;
 SizeAsReceived:8833; Count:47
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50]) by MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 02:50:01 +0000
Message-ID: <MEAPR01MB349456E1D3EB1CBF978C48ACFCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
Subject: Re: [PATCH v4 4/7] fuzz: loop the remove minimizer and refactoring
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: Alexander Bulekov <alxndr@bu.edu>
Date: Fri, 08 Jan 2021 10:49:47 +0800
In-Reply-To: <20210107045328.owso2kow2gvqbdzq@mozz.bu.edu>
References: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB17457CC3B59A47C3005560DCFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
 <20210107045328.owso2kow2gvqbdzq@mozz.bu.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-TMN: [xBbg7VcthAJKwWuylutzBgig83/SBa87]
X-ClientProxiedBy: AM0PR02CA0027.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::40) To MEAPR01MB3494.ausprd01.prod.outlook.com
 (2603:10c6:201:39::11)
X-Microsoft-Original-Message-ID: <0ffd3ce42e9963ec59c1c8f0420197b4cfb1a8ac.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (104.193.8.207) by
 AM0PR02CA0027.eurprd02.prod.outlook.com (2603:10a6:208:3e::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 02:49:56 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 3227e55d-6413-4993-679c-08d8b380181a
X-MS-TrafficTypeDiagnostic: HK2APC01HT068:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mZ16HOlJguI55L9rZovnHE+jdn3XKBpnUfpp+c4/3IeX44X+czeDxL3ADYJKBMkhAuTyufuvnJG+fiMZILHUNUo1NOVXwF3D26OnheglVDUtZE+99HQKUKHjMrwZTJtWplQ/0BFH+B9NW6fQt8+oFoLnZTrSoBoETMz7hsoKDpyUmo3SSkjZMt4sX2VEI2k0xRPSG5u3Tkr66EUxGh/uH2aprrdiIpfT47ZfSDrrILH6PmxXK4CjFNK4mNYIRgvS
X-MS-Exchange-AntiSpam-MessageData: Qy7z2ffajTVFPpc1txY9n7Q0RJqmMBYpafcymZgJsBrUWsSGxZLVaW1DrlvTQDFCFXAJeRFbKNuy+0fnNrEka4fIyw0qZKi5EFdapTUs15OG/fF6UdTHrFFYk3Qy1hvC8UKmz1/7n/CMJY1o2lPxwQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 02:50:01.3914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 3227e55d-6413-4993-679c-08d8b380181a
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT029.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT068
Received-SPF: pass client-ip=40.92.254.95; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-PU1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: thuth@redhat.com, qemu-devel@nongnu.org, darren.kenny@oracle.com,
 bsd@redhat.com, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-01-06 at 23:53 -0500, Alexander Bulekov wrote:
> On 201229 1240, Qiuhao Li wrote:
> > Now we use a one-time scan and remove strategy in the remval
> > minimizer,
> > which is not suitable for timing dependent instructions.
> > 
> > For example, instruction A will indicate an address where the
> > config
> > chunk locates, and instruction B will make the configuration
> > active. If
> > we have the following instruction sequence:
> > 
> > ...
> > A1
> > B1
> > A2
> > B2
> > ...
> > 
> > A2 and B2 are the actual instructions that trigger the bug.
> > 
> > If we scan from top to bottom, after we remove A1, the behavior of
> > B1
> > might be unknowable, including not to crash the program. But we
> > will
> > successfully remove B1 later cause A2 and B2 will crash the process
> > anyway:
> > 
> > ...
> > A1
> > A2
> > B2
> > ...
> > 
> > Now one more trimming will remove A1.
> > 
> > In the perfect case, we would need to be able to remove A and B (or
> > C!) at
> > the same time. But for now, let's just add a loop around the
> > minimizer.
> > 
> > Since we only remove instructions, this iterative algorithm is
> > converging.
> > 
> > Tested with Bug 1908062.
> > 
> > Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> 
> Small note below, but otherwise:
> Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
> 
> > ---
> >  scripts/oss-fuzz/minimize_qtest_trace.py | 41 +++++++++++++++-----
> > ----
> >  1 file changed, 26 insertions(+), 15 deletions(-)
> > 
> > diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py
> > b/scripts/oss-fuzz/minimize_qtest_trace.py
> > index 1a26bf5b93..378a7ccec6 100755
> > --- a/scripts/oss-fuzz/minimize_qtest_trace.py
> > +++ b/scripts/oss-fuzz/minimize_qtest_trace.py
> > @@ -71,21 +71,9 @@ def check_if_trace_crashes(trace, path):
> >      return False
> >  
> >  
> > -def minimize_trace(inpath, outpath):
> > -    global TIMEOUT
> > -    with open(inpath) as f:
> > -        trace = f.readlines()
> > -    start = time.time()
> > -    if not check_if_trace_crashes(trace, outpath):
> > -        sys.exit("The input qtest trace didn't cause a crash...")
> > -    end = time.time()
> > -    print("Crashed in {} seconds".format(end-start))
> > -    TIMEOUT = (end-start)*5
> > -    print("Setting the timeout for {} seconds".format(TIMEOUT))
> > -
> > -    i = 0
> > -    newtrace = trace[:]
> > +def remove_minimizer(newtrace, outpath):
> 
> Maybe a different name for this function?
> e.g. minimize_each_line or minimize_iter
> 
> -Alex

Ok, changed to remove_lines in version 5, thanks.

> 
> >      remove_step = 1
> > +    i = 0
> >      while i < len(newtrace):
> >          # 1.) Try to remove lines completely and reproduce the
> > crash.
> >          # If it works, we're done.
> > @@ -174,7 +162,30 @@ def minimize_trace(inpath, outpath):
> >                      newtrace[i] = prior[0]
> >                      del newtrace[i+1]
> >          i += 1
> > -    check_if_trace_crashes(newtrace, outpath)
> > +
> > +
> > +def minimize_trace(inpath, outpath):
> > +    global TIMEOUT
> > +    with open(inpath) as f:
> > +        trace = f.readlines()
> > +    start = time.time()
> > +    if not check_if_trace_crashes(trace, outpath):
> > +        sys.exit("The input qtest trace didn't cause a crash...")
> > +    end = time.time()
> > +    print("Crashed in {} seconds".format(end-start))
> > +    TIMEOUT = (end-start)*5
> > +    print("Setting the timeout for {} seconds".format(TIMEOUT))
> > +
> > +    newtrace = trace[:]
> > +
> > +    # remove minimizer
> > +    old_len = len(newtrace) + 1
> > +    while(old_len > len(newtrace)):
> > +        old_len = len(newtrace)
> > +        remove_minimizer(newtrace, outpath)
> > +        newtrace = list(filter(lambda s: s != "", newtrace))
> > +
> > +    assert(check_if_trace_crashes(newtrace, outpath))
> >  
> >  
> >  if __name__ == '__main__':
> > -- 
> > 2.25.1
> > 


