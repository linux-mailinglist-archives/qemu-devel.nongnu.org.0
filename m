Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C495A6643
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 16:26:35 +0200 (CEST)
Received: from localhost ([::1]:40062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT2CI-0007hP-4h
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 10:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oT2AX-000627-73
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 10:24:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oT2AT-0004zv-TK
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 10:24:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661869480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VXzKj/RY3ixxSTq+sZifpQcLAZ93evH3TasLCwIvhqY=;
 b=PZ4ZQJzGzRcDwoHxb9VFPbYdiQwagcsnOZwnEBQI1BomQSihoN6IsdCNHEx1QHaIfewS0M
 NAewctIFaZQR12/tGrofTWDCQIZAkEOTGaknWBB19BQrrjx6+LmQW6fOKLdfjbda4OXWaW
 0WhClxRZZtI305LwjDl6emOxwWglXmA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-MwEQHB-BNeCZy5jSSK-cpQ-1; Tue, 30 Aug 2022 10:24:38 -0400
X-MC-Unique: MwEQHB-BNeCZy5jSSK-cpQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 nv16-20020a056214361000b00499023aff0bso3623929qvb.12
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 07:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=VXzKj/RY3ixxSTq+sZifpQcLAZ93evH3TasLCwIvhqY=;
 b=CdY6OFGCxYxLrO3zZFz+vs9ptN5OCtzP5PkMu0nriqay9/IhRLEj0N+EekGhRG4NNp
 x38IiqB39v9OGTlYQchUCi7rU6Xbr+S4iJn+CMmDJUUA+k0OEj3fP4oEVLDGUl7ICP11
 WpaGVT0wpCzfSsnow0BHxpLuK02R3hVHfIgc9Uu8PrAEIdLtjhFhRQmnMo1CzMDfCzx3
 bIG8xe/M8G0t2mpyAGGEOj/xHaDSaoI/FmcpxBtEOVUIYKhmOfLoiG5ehupBGTHgHDAX
 02dg+yWrWKiaNu++xS97wb/KvRFCFD6VgIRqim4IV/HzQlxBxwX9a7LkQJ/iwJZQy6Fl
 YkJA==
X-Gm-Message-State: ACgBeo1yN7D26GRbi+mOFCmlR0w01BgEC7QuY8wQp982cSJ77Mnuqw9o
 F7rG6b1lbpHBdK02XD+X3I3V+9FnXyvKR8UEhdEKTNMvNbd0Ip19uk6X/MVNdiVaQhdITOyc2Yo
 qzWI9T9p6Icavm88=
X-Received: by 2002:a05:622a:34a:b0:343:6a5f:2f0 with SMTP id
 r10-20020a05622a034a00b003436a5f02f0mr15197405qtw.238.1661869478465; 
 Tue, 30 Aug 2022 07:24:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5IQ/7Z7zN8TQiHUP/Zqk4ZlalrcNHfAmHoTwL1nX4UXwYOruTk+yx68JY5nA0C0z88hJJQNQ==
X-Received: by 2002:a05:622a:34a:b0:343:6a5f:2f0 with SMTP id
 r10-20020a05622a034a00b003436a5f02f0mr15197388qtw.238.1661869478261; 
 Tue, 30 Aug 2022 07:24:38 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a05620a405000b006bb6c63114fsm8623756qko.110.2022.08.30.07.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 07:24:37 -0700 (PDT)
Date: Tue, 30 Aug 2022 10:24:36 -0400
From: Peter Xu <peterx@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v2] KVM: dirty ring: add missing memory barrier
Message-ID: <Yw4dpPtBhJ+0U13f@xz-m1.local>
References: <20220827082218.214001-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220827082218.214001-1-pbonzini@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, Aug 27, 2022 at 10:22:18AM +0200, Paolo Bonzini wrote:
> The KVM_DIRTY_GFN_F_DIRTY flag ensures that the entry is valid.  If
> the read of the fields are not ordered after the read of the flag,
> QEMU might see stale values.
> 
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks!

-- 
Peter Xu


