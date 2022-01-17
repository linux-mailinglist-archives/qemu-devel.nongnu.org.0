Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F264B49003A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 03:33:02 +0100 (CET)
Received: from localhost ([::1]:54640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9HpN-0004lJ-Ig
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 21:33:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n9Hnl-00040a-NG
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 21:31:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n9Hni-00022o-NS
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 21:31:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642386677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2exwr+9RvRCQJoQbGRpkWT0wNqjHxOQytG2XTXV60r4=;
 b=FA2tWz8chPuz6gu4Z+8Z8M1gwbvobpSMKA+wRht9/j6hMD/Xq2ON5FhqYl2ybG1FZk/vEZ
 AfZ0jM/BsgylJrMBPBjfaJoBGDRVK9wQnjT5s+GyFjkptDns0iYBxhcabo58QGZDuwRavD
 MlcDemK4XY1DIxS8LW90DP1G5itXh58=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-_pzv8MagN4G1QNjf8KqCmg-1; Sun, 16 Jan 2022 21:31:16 -0500
X-MC-Unique: _pzv8MagN4G1QNjf8KqCmg-1
Received: by mail-pl1-f198.google.com with SMTP id
 o9-20020a170902d4c900b0014ab4c82aacso213437plg.16
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 18:31:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2exwr+9RvRCQJoQbGRpkWT0wNqjHxOQytG2XTXV60r4=;
 b=FfPYFwF6he5a0AwCzUGUj82Bo64FXP59ahubs9JUnK6hZ/QfUM+4YTnetYqjpOCSG8
 MLhRD6kmIZHpWeNaIB95SGOksoRi1LA9Yv42dbxib1CBN2QBziTHgKWh/sOGOhDQ3iAw
 AtH8j96lyMllktXKeoeD2e3HRBjpDULLMtqFpb0z9BD25jcQfrGRDIW3RZHVzXCocbNs
 /XCGy6RjsbXNu2qa6c2g/WF+hpmA9HEiYv7L9TiNWLw15ALsA0mGrYybvfQtxgayxZwy
 XS46wEgNqDq9lCgO5thz8vaGyxuuiwYNy862mxf5JpLJkND8Nt6mOfymRmuSPxrekS4p
 KBKg==
X-Gm-Message-State: AOAM533uLYfKBwIs1NGxPMoZAuf9ui5tcy44VFIcE9vSawfXpEiVQxHZ
 mV8VLzzjQZlOKsW80NVVq/fZAn8bhzYgYOfUPB4EWEbM6cEu/AjW5vOuIRC9nlAgQ1GEt4N4iji
 QIXn9eJbxVIbANyg=
X-Received: by 2002:a17:902:b189:b0:143:8079:3d3b with SMTP id
 s9-20020a170902b18900b0014380793d3bmr20475618plr.71.1642386675650; 
 Sun, 16 Jan 2022 18:31:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwH3b089234kA2Nm0uoKGQPj0PhA+1VRGvZYHpcoRYfZiIhHAxhfrfrYGS2ZKQP9gxL0UXRkA==
X-Received: by 2002:a17:902:b189:b0:143:8079:3d3b with SMTP id
 s9-20020a170902b18900b0014380793d3bmr20475592plr.71.1642386675421; 
 Sun, 16 Jan 2022 18:31:15 -0800 (PST)
Received: from xz-m1.local ([191.101.132.59])
 by smtp.gmail.com with ESMTPSA id i11sm10031187pgt.68.2022.01.16.18.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 18:31:14 -0800 (PST)
Date: Mon, 17 Jan 2022 10:31:07 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v11 2/4] softmmu/dirtylimit: implement vCPU dirtyrate
 calculation periodically
Message-ID: <YeTU6z+2lokZsY5m@xz-m1.local>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
 <3f7e224b0f367ec64a21929d110b18ded2ff6d22.1641316375.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <3f7e224b0f367ec64a21929d110b18ded2ff6d22.1641316375.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 01:14:07AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Introduce the third method GLOBAL_DIRTY_LIMIT of dirty
> tracking for calculate dirtyrate periodly for dirty page
> rate limit.
> 
> Add dirtylimit.c to implement dirtyrate calculation periodly,
> which will be used for dirty page rate limit.
> 
> Add dirtylimit.h to export util functions for dirty page rate
> limit implementation.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


