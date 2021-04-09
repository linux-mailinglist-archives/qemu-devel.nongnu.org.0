Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC3135981C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 10:41:00 +0200 (CEST)
Received: from localhost ([::1]:58278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUmhH-0003FJ-Rg
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 04:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lUmfD-0002jt-TY; Fri, 09 Apr 2021 04:38:51 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lUmfB-0000eJ-Vg; Fri, 09 Apr 2021 04:38:51 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1398YRZS188549; Fri, 9 Apr 2021 04:38:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=0rAxsmFBGdYdT7XRtiNhIZHjTpSYs8Xu1VloTgmSVLU=;
 b=XN6sPjxYEdofm2kSEbcii2yla7yy+NHWHsCxiDjozmep2QrjCwjsfneun2KynxdES9jq
 tdUiS8aeMRZcfsWuAeEwqjxv6T9rICOD8HQkYaSL67WEVbvHXcYgAdTZ4CiLZVcRGPF7
 xFNagIjYQYRN55vljCkVwTqwuRVlYKSgqXsSccMXUS4DXc8Yss+CZF3U3AYO/rVRng6o
 tN7HarBKIef4UtJngVC6S91lLRCBqi/rLf6WWeRTp/+kzh16va7kM0OfSrkNkmQCtq3h
 lAKPjTXIa/fla/BlATzns99pqkxy08f//wvp0usmLtKU1jJMHtcwXoUoeJGSUj07ejky LA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37t8fmhbec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 04:38:46 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1398Yhcg189592;
 Fri, 9 Apr 2021 04:38:46 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37t8fmhbdp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 04:38:46 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1398bgdr018184;
 Fri, 9 Apr 2021 08:38:44 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 37t3h8gm9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 08:38:44 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1398cfQG31195512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Apr 2021 08:38:41 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24AFB42047;
 Fri,  9 Apr 2021 08:38:41 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3564342045;
 Fri,  9 Apr 2021 08:38:40 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.45.134])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  9 Apr 2021 08:38:40 +0000 (GMT)
Date: Fri, 9 Apr 2021 10:38:37 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] s390x: css: report errors from
 ccw_dstream_read/write
Message-ID: <20210409103837.135e994e.pasic@linux.ibm.com>
In-Reply-To: <1617899529-9329-2-git-send-email-pmorel@linux.ibm.com>
References: <1617899529-9329-1-git-send-email-pmorel@linux.ibm.com>
 <1617899529-9329-2-git-send-email-pmorel@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zuDJEKh-vFbuiZLzCZIM65aS2zCpArNZ
X-Proofpoint-ORIG-GUID: XcWc3eZuMZhOCtkavmlCXGN-71t1pfR0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_04:2021-04-09,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090063
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mst@redhat.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  8 Apr 2021 18:32:09 +0200
Pierre Morel <pmorel@linux.ibm.com> wrote:

> ccw_dstream_read/write functions returned values are sometime
> not taking into account and reported back to the upper level
> of interpretation of CCW instructions.
> 
> It follows that accessing an invalid address does not trigger
> a subchannel status program check to the guest as it should.
> 
> Let's test the return values of ccw_dstream_write[_buf] and
> ccw_dstream_read[_buf] and report it to the caller.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>

Acked-by: Halil Pasic <pasic@linux.ibm.com>

I did not look into the whole scsw.count stuff or into wether
your changes to 3270 (look form <mark></mark> in the diff part) affect
more than just ccw_dstream_*.

I would have preferred this patch split up based on the intended effect
and thus also subsystem (css, virtio-ccw, 3270), but I've alluded to
that before, and since we are in a hurry I can live with it as is.

Regards,
Halil

> ---
>  hw/char/terminal3270.c | 11 +++++--
>  hw/s390x/3270-ccw.c    |  5 +++-
>  hw/s390x/css.c         | 14 +++++----
>  hw/s390x/virtio-ccw.c  | 66 ++++++++++++++++++++++++++++++------------
>  4 files changed, 69 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/char/terminal3270.c b/hw/char/terminal3270.c
> index a9a46c8ed3..82e85fac2e 100644
> --- a/hw/char/terminal3270.c
> +++ b/hw/char/terminal3270.c
> @@ -200,9 +200,13 @@ static int read_payload_3270(EmulatedCcw3270Device *dev)
>  {
>      Terminal3270 *t = TERMINAL_3270(dev);
>      int len;
> +    int ret;
>  
>      len = MIN(ccw_dstream_avail(get_cds(t)), t->in_len);
> -    ccw_dstream_write_buf(get_cds(t), t->inv, len);
> +    ret = ccw_dstream_write_buf(get_cds(t), t->inv, len);
> +    if (ret < 0) {
> +        return ret;
> +    }
>      t->in_len -= len;
>  
>      return len;
> @@ -260,7 +264,10 @@ static int write_payload_3270(EmulatedCcw3270Device *dev, uint8_t cmd)
>  
>      t->outv[out_len++] = cmd;
>      do {
> -        ccw_dstream_read_buf(get_cds(t), &t->outv[out_len], len);
> +        retval = ccw_dstream_read_buf(get_cds(t), &t->outv[out_len], len);
> +        if (retval < 0) {
> +            return retval;
> +        }
>          count = ccw_dstream_avail(get_cds(t));
>          out_len += len;
>  
> diff --git a/hw/s390x/3270-ccw.c b/hw/s390x/3270-ccw.c
> index 821319eee6..f3e7342b1e 100644
> --- a/hw/s390x/3270-ccw.c
> +++ b/hw/s390x/3270-ccw.c
> @@ -31,6 +31,9 @@ static int handle_payload_3270_read(EmulatedCcw3270Device *dev, CCW1 *ccw)
>      }
>  
>      len = ck->read_payload_3270(dev);

<mark>

> +    if (len < 0) {
> +        return len;
> +    }
>      ccw_dev->sch->curr_status.scsw.count = ccw->count - len;
>  

</mark>

Do we eventually update scsw.count?

>      return 0;
> @@ -50,7 +53,7 @@ static int handle_payload_3270_write(EmulatedCcw3270Device *dev, CCW1 *ccw)
>      len = ck->write_payload_3270(dev, ccw->cmd_code);
>  
>      if (len <= 0) {

<mark>
> -        return -EIO;
> +        return len ? len : -EIO;

</mark>

>      }
>  
>      ccw_dev->sch->curr_status.scsw.count = ccw->count - len;
> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
> index fe47751df4..4149b8e5a7 100644

