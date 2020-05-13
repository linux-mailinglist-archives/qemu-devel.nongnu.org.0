Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D296C1D0963
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 09:02:02 +0200 (CEST)
Received: from localhost ([::1]:33866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYlOz-0003I5-Bt
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 03:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jYlNQ-0002jt-70
 for qemu-devel@nongnu.org; Wed, 13 May 2020 03:00:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37039
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jYlNO-0005fC-Iq
 for qemu-devel@nongnu.org; Wed, 13 May 2020 03:00:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589353221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=njkb1LqGpcHzOslpX3N6XpN4CrFaOxtQ2J0+BtOJa6Q=;
 b=EOP9KmJxx7bJmsXmfERwY70KDTx5gNCl99T+JeiInhhlBoBqm0EnUShqBOavbAmRNuoCvn
 UbTlIkkUBHevBkdsEN1ghS9EL8184OXnjJrK5/PgFBgUu0TD8KRel85rI/yOPau34XHQca
 4ZxorGAVO3r26TXw5sJVw0U8T11+FdA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-2uNvdgsYO1ShhF4mAUkDYA-1; Wed, 13 May 2020 03:00:19 -0400
X-MC-Unique: 2uNvdgsYO1ShhF4mAUkDYA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18CBA8014D5;
 Wed, 13 May 2020 07:00:18 +0000 (UTC)
Received: from gondolin (ovpn-113-93.ams2.redhat.com [10.36.113.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1D5318A75;
 Wed, 13 May 2020 07:00:07 +0000 (UTC)
Date: Wed, 13 May 2020 09:00:00 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Collin Walling <walling@linux.ibm.com>
Subject: Re: [PATCH v1 3/8] s390/sclp: rework sclp boundary and length checks
Message-ID: <20200513090000.4272ddab.cohuck@redhat.com>
In-Reply-To: <75157d93-2f4d-db25-4a0d-fdb4a7781135@linux.ibm.com>
References: <20200508230823.22956-1-walling@linux.ibm.com>
 <20200508230823.22956-4-walling@linux.ibm.com>
 <d894a835-d0ea-2d61-0416-c4804a755dca@redhat.com>
 <75157d93-2f4d-db25-4a0d-fdb4a7781135@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 01:56:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: frankja@linux.ibm.com, mst@redhat.com, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, svens@linux.ibm.com, pbonzini@redhat.com,
 mihajlov@linux.ibm.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 May 2020 10:55:56 -0400
Collin Walling <walling@linux.ibm.com> wrote:

> On 5/12/20 3:21 AM, David Hildenbrand wrote:
> > On 09.05.20 01:08, Collin Walling wrote:  

> >> +static bool check_sufficient_sccb_len(SCCB *sccb, int size)  
> > 
> > "has_sufficient_sccb_len" ?
> >   
> >> +{
> >> +    MachineState *ms = MACHINE(qdev_get_machine());
> >> +    int required_len = size + ms->possible_cpus->len * sizeof(CPUEntry);  
> > 
> > Rather pass in the number of cpus instead. Looking up the machine again
> > in here is ugly.  
> 
> prepare_cpu_entries also looks up the machine again. Should I squeeze
> in a cleanup where we pass the machine to that function too (perhaps
> in the "remove SCLPDevice" patch)?

sclp_read_cpu_info() does not have the machine handy, so you'd need to
move machine lookup there; but I think it's worth getting rid of
duplicate lookups.

> 
> >   
> >> +
> >> +    if (be16_to_cpu(sccb->h.length) < required_len) {
> >> +        sccb->h.response_code = cpu_to_be16(SCLP_RC_INSUFFICIENT_SCCB_LENGTH);
> >> +        return false;
> >> +    }
> >> +    return true;
> >> +}
> >> +


