Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F083AD431
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 23:11:57 +0200 (CEST)
Received: from localhost ([::1]:54658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luLmO-0006qy-AH
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 17:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1luLlR-0006CV-B0
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 17:10:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1luLlP-0006na-73
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 17:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624050653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XKFSYWmO4Su1TugsiDEcJLjXhVrcnJG/sWnIQM+Jg2o=;
 b=jWQLG1ViYdJZ2D8tTgReqPZWKkU38jnrsEm5zY4zeKROPK2YIInPTsEpmewPx6jhjs9Usg
 axhGoHk45RTSF6kfVk5o+NO+Wlr8TJ2WsjLM+PIaWuZE1hGkw7jCVrs6kRr2/INn3rffjh
 5Zr2MU4+NnltnpwJNaqemrAsYdx/joQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-PwGjUtq_NTq2MrtSVqmFig-1; Fri, 18 Jun 2021 17:10:52 -0400
X-MC-Unique: PwGjUtq_NTq2MrtSVqmFig-1
Received: by mail-qk1-f200.google.com with SMTP id
 t131-20020a37aa890000b02903a9f6c1e8bfso6730500qke.10
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 14:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XKFSYWmO4Su1TugsiDEcJLjXhVrcnJG/sWnIQM+Jg2o=;
 b=C68lpweLUG6Rdjr8fYY1m4CdZUoJlA0rhCT98jOr/j57m0vR6hIMOdvVVwqTyyLEXu
 9fSVT+Et4h1Wgxf2lVr0jkA4s0gFbeCVz80X3rDHDnnygDpI149hI03uJt04hryPFzQz
 aUL7uP74GwGxZK7Ny9k0tnB1yTDml1XrefU4kPuisXlYNjMGQUX8olFXtiyYPv++tV0m
 A9XQwXmxtaz4/uL1yMqAg8UaZXEGF4p0KwmSl2fq4ObXvBjaaAc5tDm6utYugAfoxQ3R
 /l0zGJgXPQpwKj9QyROLVmWxeLBB/PcTQovjxCG/9jFP6BcuCoe+/h5c+duxrHiSnBJv
 mdIw==
X-Gm-Message-State: AOAM533Wl4RD+XwgD+2W8d4mR557iLMoFUP0sYlEGhfMStV9mmgfHIXk
 ShTKWDsF5RtzQOfjZXcQxiXGgegHdRdBV2+3hPLJqPXVyeoCZLhrbY1naKdlQK+gLAY8DLV7o7h
 R5ToBkhD1VVLkgVI=
X-Received: by 2002:a37:7bc3:: with SMTP id
 w186mr11330977qkc.451.1624050651772; 
 Fri, 18 Jun 2021 14:10:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8ziryQr+L9E/l+1KtICtAmm7j2vvNYkvZQ7pQBhBXr/JkYk/bf0vmy+ioTmZs6Ynnh6i26g==
X-Received: by 2002:a37:7bc3:: with SMTP id
 w186mr11330950qkc.451.1624050651540; 
 Fri, 18 Jun 2021 14:10:51 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id z127sm4830017qkb.98.2021.06.18.14.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 14:10:50 -0700 (PDT)
Date: Fri, 18 Jun 2021 17:10:49 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v9 0/6] support dirtyrate at the granualrity of vcpu
Message-ID: <YM0L2VsAhXsGJick@t490s>
References: <cover.1624040308.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <cover.1624040308.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jun 19, 2021 at 02:28:54AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> v9

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu


