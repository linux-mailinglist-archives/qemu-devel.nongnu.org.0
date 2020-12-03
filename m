Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434612CDEFE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 20:31:57 +0100 (CET)
Received: from localhost ([::1]:39514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkuKZ-0006xO-U0
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 14:31:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kkuHn-00068x-I6
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 14:29:05 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:56112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kkuHk-00038I-VX
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 14:29:02 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B3JJIse057771;
 Thu, 3 Dec 2020 19:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=mime-version :
 message-id : date : from : to : cc : subject : references : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=2a6s9BoZJDvgErdFGp7KqzfHtIn466P0WcNqi9mwBBg=;
 b=wVdDsv9Zherqwf5U9bqbosvhHGM9liTwNbaGWQtHV41ymJY3KEoBvLvAvxV0uM5fOWMs
 TSgJPTGQiSqm46Qm5g1EPOZZxjUHlB+L13wpatPPrQrSPSpCMtmPSFgw4PWFgVoSK8+P
 Lcfq7tw8EX1Q8F5CN4KcXzYKoz3fXdpUDILXh6ap1gpk5LyK4pbAe7CEFeU7NS9U1t4f
 xhl/E9Du0Gw3Mr5PSGW0NufkiMjejaz3SnbU+4AcSVdT9JZjVQkSawMHcAjOOTOxDBtx
 9fQw1yHV7FKHkK92qtGa+xCIC1nOPdSFXlwt4UoaKGuRjMMCccDZqn/8NoWVhMCnmaSJ mA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 353c2b7xg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 03 Dec 2020 19:28:42 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B3JPSOR016967;
 Thu, 3 Dec 2020 19:26:41 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 3540g2a9x5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Dec 2020 19:26:41 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B3JQcuH032534;
 Thu, 3 Dec 2020 19:26:38 GMT
Received: from heatpipe (/67.180.143.163) by default (Oracle Beehive Gateway
 v4.0) with ESMTP ; Thu, 03 Dec 2020 11:26:10 -0800
MIME-Version: 1.0
Message-ID: <20201203192607.GB10578@heatpipe>
Date: Thu, 3 Dec 2020 11:26:07 -0800 (PST)
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v12 00/19] Initial support for multi-process Qemu
References: <cover.1606853298.git.jag.raman@oracle.com>
 <20201203091404.GA687169@stefanha-x1.localdomain>
In-Reply-To: <20201203091404.GA687169@stefanha-x1.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9824
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=1
 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9824
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 lowpriorityscore=0
 clxscore=1011 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012030111
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=elena.ufimtseva@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, john.g.johnson@oracle.com, swapnil.ingle@nutanix.com,
 mst@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 Jagannathan Raman <jag.raman@oracle.com>, quintela@redhat.com,
 peter.maydell@linaro.org, armbru@redhat.com, kanth.ghatraju@oracle.com,
 felipe@nutanix.com, thuth@redhat.com, ehabkost@redhat.com,
 konrad.wilk@oracle.com, dgilbert@redhat.com, alex.williamson@redhat.com,
 thanos.makatos@nutanix.com, rth@twiddle.net, kwolf@redhat.com,
 berrange@redhat.com, mreitz@redhat.com, ross.lagerwall@citrix.com,
 marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 09:14:04AM +0000, Stefan Hajnoczi wrote:
> On Tue, Dec 01, 2020 at 03:22:35PM -0500, Jagannathan Raman wrote:
> > This is the v12 of the patchset. Thank you very much for the
> > review of the v11 of the series.
> 
> I'm in favor of merging this for QEMU 6.0. The command-line interface
> has the x- prefix so QEMU is not committing to a stable interface.
> Changes needed to support additional device types or to switch to the
> vfio-user protocol can be made later.
> 

Woot! Thank you Stefan!

> Jag, Elena, JJ: I suggest getting your GPG key to Peter Maydell so you
> can send multi-process QEMU pull requests.
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

In progress.
Do we need to add some tagging for the PULL patches?
Should we include the git repo and have the proper tag as well?

Elena





