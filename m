Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64707227927
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 09:02:18 +0200 (CEST)
Received: from localhost ([::1]:53092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxmI5-00037p-Ff
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 03:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jxmGc-0002fI-U5
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 03:00:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49456
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jxmGb-0000Ln-53
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 03:00:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595314843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=ei67vaqhcaGUvzWpb7an5ohFiIh+KmBIV9Pksg5Fkec=;
 b=gckahLx94ZAS2mInjPSDc/sODomkyJAyUueRGar79StpI0350ZpOrO1OyZNwQrjisXPaBH
 UXsUC7AZtW3qwwLCuRKpTJMji4d+3Tpkspv8QKai2r0NvKMG3JJyP7ONfo+/7+SOtYzxZ1
 A/aWfMT/BlJpg+6z1BmTuQhaH2mocQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-emmcjyp1Nvqr7__LZiAQ7A-1; Tue, 21 Jul 2020 03:00:41 -0400
X-MC-Unique: emmcjyp1Nvqr7__LZiAQ7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68F28E91E;
 Tue, 21 Jul 2020 07:00:40 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-102.ams2.redhat.com [10.36.112.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32C1D61463;
 Tue, 21 Jul 2020 07:00:36 +0000 (UTC)
Subject: Re: [PATCH 5/7] pc-bios: s390x: Replace lowcore offsets with pointers
 in dasd-ipl.c
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20200715094045.381984-1-frankja@linux.ibm.com>
 <20200715094045.381984-6-frankja@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <6370ed83-902b-4607-4c88-5486e7a2573e@redhat.com>
Date: Tue, 21 Jul 2020 09:00:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200715094045.381984-6-frankja@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 01:46:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: borntraeger@de.ibm.com, cohuck@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/07/2020 11.40, Janosch Frank wrote:
> Let's replace some more constant offsets with references into the
> lowcore for better readability.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  pc-bios/s390-ccw/dasd-ipl.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/pc-bios/s390-ccw/dasd-ipl.c b/pc-bios/s390-ccw/dasd-ipl.c
> index 0543334ed4..9ab9a0fa12 100644
> --- a/pc-bios/s390-ccw/dasd-ipl.c
> +++ b/pc-bios/s390-ccw/dasd-ipl.c
> @@ -120,8 +120,8 @@ static void run_readipl(SubChannelId schid, uint16_t cutype)
>   */
>  static void check_ipl1(void)
>  {
> -    Ccw0 *ccwread = (Ccw0 *)0x08;
> -    Ccw0 *ccwtic = (Ccw0 *)0x10;
> +    Ccw0 *ccwread = (Ccw0 *) &lowcore->ccw1;
> +    Ccw0 *ccwtic = (Ccw0 *) &lowcore->ccw2;
>  
>      if (ccwread->cmd_code != CCW_CMD_DASD_READ ||
>          ccwtic->cmd_code != CCW_CMD_TIC) {
> @@ -143,15 +143,15 @@ static void check_ipl2(uint32_t ipl2_addr)
>  
>  static uint32_t read_ipl2_addr(void)
>  {
> -    Ccw0 *ccwtic = (Ccw0 *)0x10;
> +    Ccw0 *ccwtic = (Ccw0 *)&lowcore->ccw2;
>  
>      return ccwtic->cda;
>  }
>  
>  static void ipl1_fixup(void)
>  {
> -    Ccw0 *ccwSeek = (Ccw0 *) 0x08;
> -    Ccw0 *ccwSearchID = (Ccw0 *) 0x10;
> +    Ccw0 *ccwSeek = (Ccw0 *) &lowcore->ccw1;
> +    Ccw0 *ccwSearchID = (Ccw0 *) &lowcore->ccw2;
>      Ccw0 *ccwSearchTic = (Ccw0 *) 0x18;
>      Ccw0 *ccwRead = (Ccw0 *) 0x20;
>      CcwSeekData *seekData = (CcwSeekData *) 0x30;
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


