Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700A64CF31F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 09:02:56 +0100 (CET)
Received: from localhost ([::1]:41050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR8KV-0001ug-HW
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 03:02:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nR88n-0001vi-RN
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:50:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nR88l-0007o1-Rp
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:50:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646639435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b8gHeN6TYD+oQdLWou1nz12CWEGbeVceTM86ig8bHt0=;
 b=Bkdd5ke8qCcKZpU77To64ZZRmA2qlJY6N/oSXSTnmG3m33j+3b3xnBsq/5TV7IiP93dQwj
 PSghNL9NGFhgSttoMdF/B4pWWeKSL/xuKXgbfZHs/E0BMf22gU4++q5m3s4toXAI2maJKT
 khORzjiqefIFqXPgSxF72DtKukEA/W8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-C67ia9a6NeG5dbxviEX26A-1; Mon, 07 Mar 2022 02:50:34 -0500
X-MC-Unique: C67ia9a6NeG5dbxviEX26A-1
Received: by mail-wr1-f72.google.com with SMTP id
 t15-20020a5d534f000000b001f1e5759cebso440505wrv.7
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 23:50:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b8gHeN6TYD+oQdLWou1nz12CWEGbeVceTM86ig8bHt0=;
 b=FXQ0gW8DVZimCpP5OQyfIp5XhKKibZaTdft8Wt6r+tRiHewwAA6EPk7XSr6TBLtEcR
 KxWd37Xf4JsN23QEZh2srQ2bE38q6eZoOyTQ/14qJ5zC4sSqxOqX/g53ptTMpfU3tQCg
 hRACZhB6oS/29istTMIi65wlQ32hZpMADA5h0Ln6ao7sUzZgYqoxl90FvRHXK1rQbgYq
 k/+FckQ144OW7IEM32fQkc4m1SLV5ZitvDcQQxdwit0fRtyig72ByLCdWHA6+weRN+NY
 JBwznNvhHHQIFJKw7Og2VaLpYuGfAizFmUL/aX4DOTKgImv9LAqNr8xiJBY2ExnegFtS
 6+Og==
X-Gm-Message-State: AOAM533aZw4w0dbPl1RlCQb4RWHSZAXnpUGSwXXypgfG0OiJTkcuZqSt
 FJS5RcTBDgSm4IDAp5Wse+q/wNJBjBMNd71ouPm6Re+s5xP8L0i3txC0L8Raq4m4qqeaXb9DtSN
 qbomX0Fv0BoHz9YM=
X-Received: by 2002:a05:600c:4f4f:b0:37b:d847:ef15 with SMTP id
 m15-20020a05600c4f4f00b0037bd847ef15mr16877012wmq.130.1646639432888; 
 Sun, 06 Mar 2022 23:50:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9lGpTVSWH6xgRtgtnJSK+m5lSwl7cUaBKWldBvZrBJKNpFrWppzcgjbO9DRLT01eI0o6Gbg==
X-Received: by 2002:a05:600c:4f4f:b0:37b:d847:ef15 with SMTP id
 m15-20020a05600c4f4f00b0037bd847ef15mr16876982wmq.130.1646639432657; 
 Sun, 06 Mar 2022 23:50:32 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 p11-20020adf9d8b000000b001f063deef80sm8877464wre.86.2022.03.06.23.50.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 23:50:32 -0800 (PST)
Message-ID: <4f697e02-3aba-d22a-818c-be92da8c5810@redhat.com>
Date: Mon, 7 Mar 2022 08:50:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 3/5] qga: replace qemu_gettimeofday() with
 g_get_real_time()
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220307070401.171986-1-marcandre.lureau@redhat.com>
 <20220307070401.171986-4-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220307070401.171986-4-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Chris Wulff <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/03/2022 08.03, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> GLib g_get_real_time() is an alternative to gettimeofday() which allows
> to simplify our code.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   qga/commands-posix.c | 14 --------------
>   qga/commands-win32.c | 19 -------------------
>   qga/commands.c       |  5 +++++
>   3 files changed, 5 insertions(+), 33 deletions(-)


Reviewed-by: Thomas Huth <thuth@redhat.com>


