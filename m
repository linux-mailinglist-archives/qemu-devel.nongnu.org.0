Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42E247C06E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 14:05:42 +0100 (CET)
Received: from localhost ([::1]:44332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzepp-0000AU-BL
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 08:05:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzeje-0002uk-OB
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 07:59:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzejd-0004Eq-8j
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 07:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640091556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=97IfTG6RI0I5tr8Bc+NHkCpnZtl5/q8f6g64qt1ZvTg=;
 b=Py//8NEdXUKzfjtG4uLCxLM93++FcMl6bgy26lUCXJz/xmXOCiqWueqnuZZE6dnLjhZLE9
 AS/OHBoTAYMFZPIpMBVin5VTAtEk8VT5//GUkToUBLRuIkETopKn9JumTx2OLcMqQCUo6G
 xDCbnMgrmg+AoI2MxUYPKPs66MXo5Lw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-M4Mb6VArN1im64i1IxAOvQ-1; Tue, 21 Dec 2021 07:59:15 -0500
X-MC-Unique: M4Mb6VArN1im64i1IxAOvQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 f13-20020adfe90d000000b001a15c110077so4639356wrm.8
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 04:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=97IfTG6RI0I5tr8Bc+NHkCpnZtl5/q8f6g64qt1ZvTg=;
 b=B+oqaytNyeEok2vcoLTIjwi6GW022jdlUVbeOHbyRNBJbKW4bUWgrOGgVCxZgkjfgD
 4UMa4QkskdGWVZ39nYvFVHPci1e9E8gTf7JWziSbCqojMBjwgKnzVM7L2ZJp2Affi98D
 EZ7vjs4x5NAsLtrgmleDkfHU9X8J0Npw8gy+insqo+JiE8KIJbrQHhLMq3gUzVrFVRdo
 bHbn1TrRXaDFbfi0xyW0kXpDflvdRMMDA1ApIlgBifP7LkZ8MHWSx3renv0t6JLlUt9D
 CiuqDhhw3y8Y5BPGCtoK2Wkw5FVoZLZEUFM2yNgpjgG1TEjV01hIXXeP/ZwrA73FCxhd
 vOvA==
X-Gm-Message-State: AOAM532vHa58QjE6HUjnUlQMwXlajR6RQodad1mUiT9d0RMmbJXL5VOl
 AZZcfD8GrQ7sf/PZl3BWKyBmEDgE6wB81k+M+4tep5a2meA5rGPB87+s54x1+AsGYeCdG4nawwD
 iUdZa1RPmr518pBs=
X-Received: by 2002:a7b:cb51:: with SMTP id v17mr2638070wmj.185.1640091554144; 
 Tue, 21 Dec 2021 04:59:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzatkNWuMi+r/zYplRMnFInxKJf3aLu0uzRV0CUXGDm0xE9hH5xxdFMAE+3l5C/elkieVgP8Q==
X-Received: by 2002:a7b:cb51:: with SMTP id v17mr2638055wmj.185.1640091553962; 
 Tue, 21 Dec 2021 04:59:13 -0800 (PST)
Received: from xz-m1.local ([85.203.46.179])
 by smtp.gmail.com with ESMTPSA id m21sm18392612wrb.2.2021.12.21.04.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 04:59:13 -0800 (PST)
Date: Tue, 21 Dec 2021 20:59:06 +0800
From: Peter Xu <peterx@redhat.com>
To: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [PATCH v2 6/8] migration: Dump sub-cmd name in
 loadvm_process_command tp
Message-ID: <YcHPmlOMfVUeEdzd@xz-m1.local>
References: <20211220085355.2284-1-peterx@redhat.com>
 <20211220085355.2284-7-peterx@redhat.com>
 <cun35mmmfs7.fsf@oracle.com>
MIME-Version: 1.0
In-Reply-To: <cun35mmmfs7.fsf@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 21, 2021 at 10:08:24AM +0000, David Edmondson wrote:
> > @@ -22,7 +22,7 @@ loadvm_postcopy_handle_resume(void) ""
> >  loadvm_postcopy_ram_handle_discard(void) ""
> >  loadvm_postcopy_ram_handle_discard_end(void) ""
> >  loadvm_postcopy_ram_handle_discard_header(const char *ramid, uint16_t len) "%s: %ud"
> > -loadvm_process_command(uint16_t com, uint16_t len) "com=0x%x len=%d"
> > +loadvm_process_command(const char *s, uint16_t len) "com=%s len=%d"
> 
> "cmd" rather than "com", to match the code.

"com" is what it was used before (perhaps "com"mand?).  Thanks,

-- 
Peter Xu


