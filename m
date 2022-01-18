Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA22F491340
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 02:02:41 +0100 (CET)
Received: from localhost ([::1]:59312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9ctU-0002a0-8k
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 20:02:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n9cri-0001pt-3I
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:00:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n9crf-0001TL-5T
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:00:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642467646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aGyrxrM87OqHFvrspoKoeiEgi6sIZxveh3p3okF1Z7I=;
 b=D2XHPS1ss0h3nRSTAgnNc1Dof8nj9GUnC1hKEfn03W/6IHWad7JJFXO+zy/B4Pqik6jtOU
 IGRouqXk/41w237rX4Xw/JNNu2VMpchakOqgc3DW8i8JjtBWzVru9FzFOX9bYNuOtX5We8
 UwcUJ9xP56cnckIaXaZtqGKc6kDiqjs=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-AfUowGNqNQaAbJKmS3JsOg-1; Mon, 17 Jan 2022 20:00:44 -0500
X-MC-Unique: AfUowGNqNQaAbJKmS3JsOg-1
Received: by mail-pf1-f200.google.com with SMTP id
 c23-20020aa78817000000b004be3f452a95so7114755pfo.19
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 17:00:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aGyrxrM87OqHFvrspoKoeiEgi6sIZxveh3p3okF1Z7I=;
 b=5y3cFJ7qQpz3cpqPKh9ZHL9hJ0seIYyQQD4kiFlgV61+0fY66mmmDlxF7+/vbAMnfW
 HuCKa0aRw10UgycDGIXyS+xP7+ZCJ4ynEl1F1scnZg0AMFHwZpR66hx3SpAK+vyx+0/N
 DK0WuJu20e5NVkwmblA08UlFUOKAeeSK908il9I/vKLFrwXxUyxFK1WeUrbo23Rx9ZIz
 OWQw/TtmM5fh3BwmYvzA3RNb1QVR0GbLv0pqmWvX7e9tcr+2ivcq2hRtwHkVYng8ttGL
 ZF9+i8eTl0hJTrreY5G+cKCGrK4mt5UAUvD3OiS5gENb5Bp/KiQKtQ+YdNdlw1O6yjC4
 PxfQ==
X-Gm-Message-State: AOAM5328oz8wK6j+Nz1MsBeHtypuf9kI2Amlc1AqNPKeDVaBRg7hNKoB
 gvFwUOO+dgiiclrt0rsjKwAQ9rJdkJBuAyFf8OEmMNYQo2d3vigp2+1Llp0H3zY1qJd85lKrY7G
 UX3Phn+4fs9majS0=
X-Received: by 2002:a17:902:e34b:b0:14a:4b9e:a0f2 with SMTP id
 p11-20020a170902e34b00b0014a4b9ea0f2mr24991613plc.91.1642467643735; 
 Mon, 17 Jan 2022 17:00:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlRBeI5ddShonT9O8j7Jfp03IM3CpOdiRgXgvTru3fsjPJcLD+um3glGsSznyhgCjbnI6QaA==
X-Received: by 2002:a17:902:e34b:b0:14a:4b9e:a0f2 with SMTP id
 p11-20020a170902e34b00b0014a4b9ea0f2mr24991577plc.91.1642467643373; 
 Mon, 17 Jan 2022 17:00:43 -0800 (PST)
Received: from xz-m1.local ([191.101.132.55])
 by smtp.gmail.com with ESMTPSA id s7sm16277929pfu.133.2022.01.17.17.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:00:42 -0800 (PST)
Date: Tue, 18 Jan 2022 09:00:36 +0800
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v11 3/4] softmmu/dirtylimit: implement virtual CPU throttle
Message-ID: <YeYRNHsmZJneG/x5@xz-m1.local>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
 <0381e32c2cc70613613aaa284b8e8c9760d6932f.1641316375.git.huangy81@chinatelecom.cn>
 <YeUbhC7MG32K9pxu@xz-m1.local>
 <1b41a2ed-4d78-6221-88c4-2b14bad6bd70@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <1b41a2ed-4d78-6221-88c4-2b14bad6bd70@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 17, 2022 at 10:00:57PM +0800, Hyman Huang wrote:
> > This algorithm seems works even worse than the previous version, could you have
> > a look on what's wrong?
> What number the dirty-ring-size of qemu be configured? is it the same as
> previous version test?

It should be the same 4096.

The test environment can be slightly different, I used a larger guest this time
(20G, 40 cores), though.  Previously it should be a few gig only with a few cores.

Side note: would you also consider picking up this patch along with the series?

https://lore.kernel.org/qemu-devel/20211130080028.6474-1-peterx@redhat.com/

I wanted to make sure it lands before this series, e.g., when enabled both
dirty limit and migration, disabling dirty limit might trigger the bug already.

Thanks,

-- 
Peter Xu


