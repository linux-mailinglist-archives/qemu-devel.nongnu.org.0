Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6924F4CF24C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 07:53:28 +0100 (CET)
Received: from localhost ([::1]:60492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR7FH-0002ez-0B
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 01:53:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR7DU-0001ov-En
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 01:51:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR7DQ-0007Gt-Uz
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 01:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646635890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VRChV+CBkas0erQ+WzjtpRUsCYhBWtxz54nAxwJav+c=;
 b=gkWjE8NBrQQTPuLgw5vkVoDjgN/Yhb9o5i35/vVCvm59Js4r5SfJImSjw6Rp+Qbm19ni66
 pq6nBVKci/pJ79YNkKci7SXsweAuzUT9KoJIAl8bvt3REnwJT0vOMJ1iWZPaMgkZ2cPNYM
 fL2QLq2jrMKVxVRMYIISNJQ4lCZ0MeI=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-8BYsEG5QNeWqw4xVTrfKoQ-1; Mon, 07 Mar 2022 01:51:29 -0500
X-MC-Unique: 8BYsEG5QNeWqw4xVTrfKoQ-1
Received: by mail-pg1-f197.google.com with SMTP id
 h12-20020a63530c000000b0037c8f45bf1bso5137268pgb.7
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 22:51:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VRChV+CBkas0erQ+WzjtpRUsCYhBWtxz54nAxwJav+c=;
 b=J8v0z8583ThHJTRigIXq+9h2Gc986G0cIOSht1b8q8L6A3/6HCdR5GDKS0AbOsaJwg
 vBoj8Mfl/mAagUoqGj3z17jdmCB2Yls/JTDalj4MhElzRcpVmEzXNCgk5HI5YrdbUUQE
 E5O4PKQC5sLgbdxqvjQBwIIg9Lt8S+uaa7Gz6mnT3/zxE9jyNoH6rMDmBuEngbfqrRIF
 hv0zFmPieQFbUmTXBPJDDjmxRKi2gvrncrwglye+Q1WS2HOtCaiXWbrz7IQdsU6kARB7
 HnfSQdsQXxAAsreuSPf7iFoDH+StOWQaeVT+3Om0b+48laS3IiXz1eTnXBAskeIy+mHt
 BcVw==
X-Gm-Message-State: AOAM533TDbM7iTRZoULYFHQsrmHeSDfX1zMOhb40fkV4NMza7oKGPlIM
 XeG4MdtgPb317bw8d31WjidTqgfmEdXJKwpxLJLgS5wTKWg6NlH0ZvWiR3ELC7ysWv09BW6qNlg
 ghckwdTj1r/woF6c=
X-Received: by 2002:a62:dd03:0:b0:4f1:1bfa:134c with SMTP id
 w3-20020a62dd03000000b004f11bfa134cmr11415177pff.14.1646635888571; 
 Sun, 06 Mar 2022 22:51:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzivX8AfzGm2DfbZlXm+G0yrfEtpYyi9+rEFOA+ZUvAsoQl0bYreZUYtQcDF0xXcj+5ol2YZw==
X-Received: by 2002:a62:dd03:0:b0:4f1:1bfa:134c with SMTP id
 w3-20020a62dd03000000b004f11bfa134cmr11415156pff.14.1646635888308; 
 Sun, 06 Mar 2022 22:51:28 -0800 (PST)
Received: from xz-m1.local ([94.177.118.47]) by smtp.gmail.com with ESMTPSA id
 f20-20020a056a001ad400b004f6e8f8f90bsm5021959pfv.109.2022.03.06.22.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 22:51:27 -0800 (PST)
Date: Mon, 7 Mar 2022 14:51:23 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 04/18] tests: print newline after QMP response in qtest
 logs
Message-ID: <YiWra21XaVV9Fdv/@xz-m1.local>
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-5-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220302174932.2692378-5-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 02, 2022 at 05:49:18PM +0000, Daniel P. Berrangé wrote:
> The QMP commands have a trailing newline, but the response does not.
> This makes the qtest logs hard to follow as the next QMP command
> appears in the same line as the previous QMP response.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/qtest/libqtest.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index a85f8a6d05..79c3edcf4b 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -629,6 +629,9 @@ QDict *qmp_fd_receive(int fd)
>          }
>          json_message_parser_feed(&qmp.parser, &c, 1);
>      }
> +    if (log) {
> +        g_assert(write(2, "\n", 1) == 1);
> +    }

Drop the g_assert() to remove side effect of G_DISABLE_ASSERT?

-- 
Peter Xu


