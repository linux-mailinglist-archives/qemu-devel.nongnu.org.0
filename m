Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462AE47EB85
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 06:18:18 +0100 (CET)
Received: from localhost ([::1]:50212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0cy9-0000xQ-Cg
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 00:18:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0cwL-0008N9-RR
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 00:16:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0cwJ-0001zi-7o
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 00:16:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640322982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3ARCOoI1pcyoJDhl5TakV8nF6wbmPd+i+H8ijTicBgE=;
 b=asiL+sUcauoP8NWhhjnND9/TVkWnLHrYqSONmdZoFFwR3EArxvp4H5LY2xtoGSjvsBuhDq
 AjdPkdBmesZMG45kQ8eohLmkL6trg/IzURoBJP2n2T39A3hQeti8G2VkuQzyi+E03gKG+K
 29OZLmzjHig6HtOhAt72MF3tve7GYIA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-W_y-yJZXND6g_9klz832lw-1; Fri, 24 Dec 2021 00:16:18 -0500
X-MC-Unique: W_y-yJZXND6g_9klz832lw-1
Received: by mail-wm1-f71.google.com with SMTP id
 p22-20020a05600c1d9600b00345a25ea8cfso2885171wms.5
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 21:16:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3ARCOoI1pcyoJDhl5TakV8nF6wbmPd+i+H8ijTicBgE=;
 b=12nUT2g5WcbGdLhBYgTAmbIX62H4Q3CjdBvd7Zk/d+i0ALYlLtvWwZoNI1SGcxiuAV
 rhjTs9KqW5194gQwNkpcjgjxuXW9n3xOLU+iARrB9KyXjCHj1q6pBBRBRjaT5hp/zmJg
 Y7JbRwdzRmDps2D01ewuyzExwgGudzkAmQ4VsyrTN4a7xY1cecRcMjbq1/aYGrkYmNS8
 iw3rCg7sBtJt975OE1I7Ne1uu3LaZIKMZ9/xsQ7vw1f6o3GMbLiNwg01JiSuq7DvypsH
 8nROs3pvFUXG5u2mIK5aiSH+JRxbXvQu9I9Bus6FAk72IAKXwgojtCNkewgdAKh4nryY
 +LRQ==
X-Gm-Message-State: AOAM532TG2g3PyzLstGhT44sbt5H4uC0bBvDXdjzAlSNNMQILqqB6DH2
 7MMBHJBUyRN/yZ/xJ4SOLN3fIfX8JhvvuenwLvfRZwru9xahLA5PBAPWh5GVzJDnun6UTm9mkkR
 uKEa4pkEh0UB1y+w=
X-Received: by 2002:a1c:1b08:: with SMTP id b8mr3600618wmb.28.1640322976835;
 Thu, 23 Dec 2021 21:16:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyeF5WPfeiHblBIZUccqe7oXYx+J9013K5Fbc/HqMVOiCrwvBUesg9JtS+e2oEnH8IImS27Vg==
X-Received: by 2002:a1c:1b08:: with SMTP id b8mr3600603wmb.28.1640322976616;
 Thu, 23 Dec 2021 21:16:16 -0800 (PST)
Received: from xz-m1.local ([85.203.46.180])
 by smtp.gmail.com with ESMTPSA id j26sm8345383wms.46.2021.12.23.21.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 21:16:16 -0800 (PST)
Date: Fri, 24 Dec 2021 13:16:10 +0800
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v10 3/3] cpus-common: implement dirty page limit on
 virtual CPU
Message-ID: <YcVXkHEkFqfcLztG@xz-m1.local>
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
 <cover.1639479557.git.huangy81@chinatelecom.cn>
 <d54bfe75d5d64e64a21bda977d40f62579cd0222.1639479557.git.huangy81@chinatelecom.cn>
 <874k7anwtc.fsf@dusky.pond.sub.org>
 <4397f17c-4431-8480-127b-4228271523c8@chinatelecom.cn>
 <Ybmiw59Qh3sHukyh@xz-m1.local> <87y24m2df7.fsf@dusky.pond.sub.org>
 <YbrbQYiEMGz864aB@xz-m1.local>
 <a6dc86b7-29c2-fa08-ad16-017d8b1301d9@chinatelecom.cn>
 <877dc4yhjq.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <877dc4yhjq.fsf@dusky.pond.sub.org>
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Hyman Huang <huangy81@chinatelecom.cn>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 16, 2021 at 11:23:37AM +0100, Markus Armbruster wrote:
> Hyman Huang <huangy81@chinatelecom.cn> writes:
> 
> [...]
> 
> > So the final format of qmp we conclude are:
> >
> > case 1: setup vcpu 0 dirty page limit 100MB/s
> > set-vcpu-dirty-limit cpu-index=0 dirty-rate=100
> >
> > case 2: setup all vcpu dirty page limit 100MB/s
> > set-vcpu-dirty-limit dirty-rate=100
> >
> > case 3: cancel vcpu 0 dirty page limit
> > cancel-vcpu-dirty-limit cpu-index=0
> >
> > case 4: cancel all vcpu dirty page limit
> > cancel-vcpu-dirty-limit
> >
> > case 5: query limit infomatioin of all vcpu enabled
> > query-vcpu-dirty-limit
> >
> > And the corresponding hmp format keep the same style:
> >
> > Is there any advice? :)
> 
> Looks okay to me.

Same here.

-- 
Peter Xu


