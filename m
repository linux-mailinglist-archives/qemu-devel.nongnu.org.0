Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F0E701E45
	for <lists+qemu-devel@lfdr.de>; Sun, 14 May 2023 18:43:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyEno-0000El-Pp; Sun, 14 May 2023 12:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pyEnm-0000EJ-IL
 for qemu-devel@nongnu.org; Sun, 14 May 2023 12:42:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pyEnX-0001gQ-7Y
 for qemu-devel@nongnu.org; Sun, 14 May 2023 12:42:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684082533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DcrZZotKjYezVkJ5gsTltWufwpTvzsWXDhVRJoOUAlo=;
 b=b5DFeYbzUCzHvaxzVI915Djh9NvxrdYWrA8wY+8wXmrG1K/oauuiiPpM5lPkslkXSgXMoP
 JpFwNu1X6F9m9OSakY2js5zVIzD3woyRKaF9iad1uKqCbGj1T5er5oCaHizjdHfRMEv5Au
 nsLd4TlkDV6dYVftnbHck//uXROFWzY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-73NnaiJJNyuvDftOqIHMeA-1; Sun, 14 May 2023 12:42:11 -0400
X-MC-Unique: 73NnaiJJNyuvDftOqIHMeA-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-61acaf012f0so68428586d6.1
 for <qemu-devel@nongnu.org>; Sun, 14 May 2023 09:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684082531; x=1686674531;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DcrZZotKjYezVkJ5gsTltWufwpTvzsWXDhVRJoOUAlo=;
 b=ZVI4VcSJHE6iBx4HoMjGIQi3/m60Y7W2JvCe+GBn+KkyTLpKHOCiAmFcjwaarWYUtg
 KTsxb6W6wW33ggrFCcYaPQRytiLoW7swUG70LfH8fkEGz+dlnK5jxzxTMxacUGukPxsj
 qKC/Bqi8LkHBfM/x9To3Gpw0sQ44HXD5eWuUSQm62RB169/QBy3x0s9jlqGSLcRXSp1l
 F47fFScnJI4PbCWx1GFCzx6mCmx2TG9FGfAfH4jQWuGV3m6m7RAFEnYfBy0/3wp87AAZ
 bbo4KUmMP25Yqu9OdzOkWFpibjawRfX1maR2eSheohMP96iU3dhheq83M3tjK82DOWHi
 8q7Q==
X-Gm-Message-State: AC+VfDwxjXPX8WnX5FMtEWgdub7H5xE7cI9pXXCXIzzXy+jEApDQeY4e
 rge3k785FPm410sLQEYBpOZYa9ZIKDnpSLV8FY/bje8ebTKb1Er/8Y8ZWTEMlaXk4oul1CX6c3A
 PSS4Bfy9aqkx7cFY=
X-Received: by 2002:ac8:5b13:0:b0:3f3:8fe7:396b with SMTP id
 m19-20020ac85b13000000b003f38fe7396bmr43505371qtw.23.1684082530946; 
 Sun, 14 May 2023 09:42:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ybJ4MjydLwyeGegHnymt3u62d0vC7IaKcHmQDHqYxTxOKPo/M5O8LTW+JoQ0wgSV8M2t9jg==
X-Received: by 2002:ac8:5b13:0:b0:3f3:8fe7:396b with SMTP id
 m19-20020ac85b13000000b003f38fe7396bmr43505349qtw.23.1684082530744; 
 Sun, 14 May 2023 09:42:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 cq6-20020a05622a424600b003f4f6ac0052sm2200880qtb.95.2023.05.14.09.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 May 2023 09:42:09 -0700 (PDT)
Message-ID: <f673d018-b6e9-a5e1-9433-daffcad9406b@redhat.com>
Date: Sun, 14 May 2023 18:42:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/8] migration: Add precopy initial data handshake
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230501140141.11743-1-avihaih@nvidia.com>
 <20230501140141.11743-3-avihaih@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230501140141.11743-3-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.93, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello Avihai,

> +static int loadvm_handle_initial_data_enable(MigrationIncomingState *mis)
> +{
> +    InitialDataInfo buf;
> +    SaveStateEntry *se;
> +    ssize_t read_size;
> +
> +    read_size = qemu_get_buffer(mis->from_src_file, (void *)&buf, sizeof(buf));
> +    if (read_size != sizeof(buf)) {
> +        error_report("%s: Could not get data buffer, read_size %ld, len %lu",

please use %zd and %zu for ssize_t.

Thanks,

C.


