Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C075A6B4790
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 15:51:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pae4W-0004qw-NG; Fri, 10 Mar 2023 09:50:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pae4Q-0004pm-L9
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 09:50:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pae4M-00049y-Kh
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 09:50:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678459804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AoeHYhUHES8+DlhTsrmZEDwxmHCD5CRwU7ioPMusGs8=;
 b=jLRIb7pL8EI6AMqCSYFJrA7zlewtfo4KV0B+giX5Ed8wxoKEZoK6OUUeWJA52EuV/qT7kj
 oIVC9Yks2V630DAdEYRmfaazH+TYQtXRVwmQ2pft5wper5agLYLbdGlxUZeVkhgS9dp+9D
 bERsDkc/TLHVaVvtQH+XDd1oexrzklU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-9k-TJQgpP_eDizFM4iTBuw-1; Fri, 10 Mar 2023 09:50:03 -0500
X-MC-Unique: 9k-TJQgpP_eDizFM4iTBuw-1
Received: by mail-qk1-f197.google.com with SMTP id
 d10-20020a05620a240a00b0073baf1de8ebso3179767qkn.19
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 06:50:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678459803;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AoeHYhUHES8+DlhTsrmZEDwxmHCD5CRwU7ioPMusGs8=;
 b=3FjfOvR7IkjVdghZsAtXhLx8wIWGEQwLTsaOhnL8LhnvYcKFnmm3hwJrE1S/n5mvH+
 G8wkun/voFh1nhEK808eSRkDGOKPwN97naGqefYsu8ApoE/784htxL12o77q3tE6ojuK
 RFUAy69SYY/wdyqPrQyZKUc6nhqGFhXlEal0VX9obrKeovmYfgbYV1D6cauu5mcvV/Jd
 XJKQQhTddoMB8blCLroN6VtExF7OJG1pN6ZhWppAreAq5dgnHtWACO7zkNl4/omrWMdP
 qptwwL6vB3dN9lF0dnp/nXe1+zQ9q6LPkffXhYLBvmBt5FVdQFiyIE4ZXsioIuKBi6aQ
 m8oQ==
X-Gm-Message-State: AO0yUKVDg51n6sU4Dr6KsxPGrhvjcPhFqxj1DaRHBYguxvvBGp+BLH0K
 RvyWXGmn29RfkCdSUVFgtVidrVf47CA6ZIC9RbWTkKi/0+d9n8EvW2hLJVypurtc8FxB57edP/y
 6hTokvVL38G2PMkE=
X-Received: by 2002:a05:622a:1b9e:b0:3bf:a3d0:9023 with SMTP id
 bp30-20020a05622a1b9e00b003bfa3d09023mr11195226qtb.5.1678459802768; 
 Fri, 10 Mar 2023 06:50:02 -0800 (PST)
X-Google-Smtp-Source: AK7set9M5XFbuJUPCX1frF9sKhg4cmE97t+iiGR1sT0DBsbePb+rT/qQrcwS7mhFBSnW3hqr0KjGZQ==
X-Received: by 2002:a05:622a:1b9e:b0:3bf:a3d0:9023 with SMTP id
 bp30-20020a05622a1b9e00b003bfa3d09023mr11195194qtb.5.1678459802535; 
 Fri, 10 Mar 2023 06:50:02 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 n189-20020a3740c6000000b007426b917031sm1391755qka.121.2023.03.10.06.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 06:50:01 -0800 (PST)
Date: Fri, 10 Mar 2023 09:50:00 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [PATCH v7 2/6] rcu: Introduce rcu_read_is_locked()
Message-ID: <ZAtDmE4GA8snZAIg@x1n>
References: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
 <20230310022425.2992472-3-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230310022425.2992472-3-xuchuangxclwt@bytedance.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 10, 2023 at 10:24:21AM +0800, Chuang Xu wrote:
> Add rcu_read_is_locked() to detect holding of rcu lock.
> 
> Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


