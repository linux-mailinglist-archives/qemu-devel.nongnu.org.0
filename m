Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0C7359B88
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 12:12:55 +0200 (CEST)
Received: from localhost ([::1]:42934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUo8E-0007RO-Ay
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 06:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lUo6e-0006tk-JN
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:11:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lUo6a-0006XC-DK
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617963070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XUpQDsTMb/oHY4xBicBJNvtamr+ypiMEZhegbXXdGcg=;
 b=d52B8kh6mkZGka2T2lmBDjKjmmiUCo65jFG/app3FJAyPq4XZcbk5li72SwRalKG7hXdio
 i47iysqMDh+c7yDcY4xsEulWnWOGa5nR94qfp92a0JaBfaDGXt/8VBj7/NDv45Zs3AFMRs
 OKGNVCpLvZ9AFWKQts4jZfmEPgRuBYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-va-xHHSwP0GD2hByVt2Q5w-1; Fri, 09 Apr 2021 06:11:09 -0400
X-MC-Unique: va-xHHSwP0GD2hByVt2Q5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C276618B9F7A;
 Fri,  9 Apr 2021 10:11:07 +0000 (UTC)
Received: from gondolin (ovpn-113-112.ams2.redhat.com [10.36.113.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF309627DC;
 Fri,  9 Apr 2021 10:11:04 +0000 (UTC)
Date: Fri, 9 Apr 2021 12:11:02 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] s390x: css: report errors from
 ccw_dstream_read/write
Message-ID: <20210409121102.2e7da357.cohuck@redhat.com>
In-Reply-To: <7fe88dbf-7d0e-41bd-94f7-0f14bdae92b9@linux.ibm.com>
References: <1617899529-9329-1-git-send-email-pmorel@linux.ibm.com>
 <1617899529-9329-2-git-send-email-pmorel@linux.ibm.com>
 <20210409103837.135e994e.pasic@linux.ibm.com>
 <20210409104938.465b81de.cohuck@redhat.com>
 <7fe88dbf-7d0e-41bd-94f7-0f14bdae92b9@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, david@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 9 Apr 2021 11:55:56 +0200
Pierre Morel <pmorel@linux.ibm.com> wrote:

> On 4/9/21 10:49 AM, Cornelia Huck wrote:
> > On Fri, 9 Apr 2021 10:38:37 +0200
> > Halil Pasic <pasic@linux.ibm.com> wrote:
> >   
> >> On Thu,  8 Apr 2021 18:32:09 +0200
> >> Pierre Morel <pmorel@linux.ibm.com> wrote:
> >>  
> >>> ccw_dstream_read/write functions returned values are sometime
> >>> not taking into account and reported back to the upper level
> >>> of interpretation of CCW instructions.
> >>>
> >>> It follows that accessing an invalid address does not trigger
> >>> a subchannel status program check to the guest as it should.
> >>>
> >>> Let's test the return values of ccw_dstream_write[_buf] and
> >>> ccw_dstream_read[_buf] and report it to the caller.
> >>>
> >>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>  
> >>
> >> Acked-by: Halil Pasic <pasic@linux.ibm.com>
> >>
> >> I did not look into the whole scsw.count stuff or into wether
> >> your changes to 3270 (look form <mark></mark> in the diff part) affect
> >> more than just ccw_dstream_*.
> >>
> >> I would have preferred this patch split up based on the intended effect
> >> and thus also subsystem (css, virtio-ccw, 3270), but I've alluded to
> >> that before, and since we are in a hurry I can live with it as is.
> >>
> >> Regards,
> >> Halil
> >>  
> >>> ---
> >>>   hw/char/terminal3270.c | 11 +++++--
> >>>   hw/s390x/3270-ccw.c    |  5 +++-
> >>>   hw/s390x/css.c         | 14 +++++----
> >>>   hw/s390x/virtio-ccw.c  | 66 ++++++++++++++++++++++++++++++------------
> >>>   4 files changed, 69 insertions(+), 27 deletions(-)
> >>>
> >>> diff --git a/hw/char/terminal3270.c b/hw/char/terminal3270.c
> >>> index a9a46c8ed3..82e85fac2e 100644
> >>> --- a/hw/char/terminal3270.c
> >>> +++ b/hw/char/terminal3270.c
> >>> @@ -200,9 +200,13 @@ static int read_payload_3270(EmulatedCcw3270Device *dev)
> >>>   {
> >>>       Terminal3270 *t = TERMINAL_3270(dev);
> >>>       int len;
> >>> +    int ret;
> >>>   
> >>>       len = MIN(ccw_dstream_avail(get_cds(t)), t->in_len);
> >>> -    ccw_dstream_write_buf(get_cds(t), t->inv, len);
> >>> +    ret = ccw_dstream_write_buf(get_cds(t), t->inv, len);
> >>> +    if (ret < 0) {
> >>> +        return ret;
> >>> +    }
> >>>       t->in_len -= len;
> >>>   
> >>>       return len;
> >>> @@ -260,7 +264,10 @@ static int write_payload_3270(EmulatedCcw3270Device *dev, uint8_t cmd)
> >>>   
> >>>       t->outv[out_len++] = cmd;
> >>>       do {
> >>> -        ccw_dstream_read_buf(get_cds(t), &t->outv[out_len], len);
> >>> +        retval = ccw_dstream_read_buf(get_cds(t), &t->outv[out_len], len);
> >>> +        if (retval < 0) {
> >>> +            return retval;
> >>> +        }
> >>>           count = ccw_dstream_avail(get_cds(t));
> >>>           out_len += len;
> >>>   
> >>> diff --git a/hw/s390x/3270-ccw.c b/hw/s390x/3270-ccw.c
> >>> index 821319eee6..f3e7342b1e 100644
> >>> --- a/hw/s390x/3270-ccw.c
> >>> +++ b/hw/s390x/3270-ccw.c
> >>> @@ -31,6 +31,9 @@ static int handle_payload_3270_read(EmulatedCcw3270Device *dev, CCW1 *ccw)
> >>>       }
> >>>   
> >>>       len = ck->read_payload_3270(dev);  
> >>
> >> <mark>
> >>  
> >>> +    if (len < 0) {
> >>> +        return len;
> >>> +    }
> >>>       ccw_dev->sch->curr_status.scsw.count = ccw->count - len;
> >>>       
> >>
> >> </mark>
> >>
> >> Do we eventually update scsw.count?  
> > 
> > I think we can consider the contents of scsw.count 'unpredictable', no?  
> 
> I think so, the (len < 0) here will trigger a program check and the POP 
> specifies the count as "not meaningful" in case of a program check.

Yes, that's what I meant.

> 
> 
> >   
> >>  
> >>>       return 0;
> >>> @@ -50,7 +53,7 @@ static int handle_payload_3270_write(EmulatedCcw3270Device *dev, CCW1 *ccw)
> >>>       len = ck->write_payload_3270(dev, ccw->cmd_code);
> >>>   
> >>>       if (len <= 0) {  
> >>
> >> <mark>  
> >>> -        return -EIO;
> >>> +        return len ? len : -EIO;  
> >>
> >> </mark>  
> 
> Here we do not change the previous behavior.
> This problem, if it is one, is not related to not checking the dstream 
> read/write functions.

I agree.

> 
> >>  
> >>>       }
> >>>   
> >>>       ccw_dev->sch->curr_status.scsw.count = ccw->count - len;
> >>> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
> >>> index fe47751df4..4149b8e5a7 100644  
> >>  
> >   
> 


