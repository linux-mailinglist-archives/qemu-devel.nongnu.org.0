Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86C33EEE32
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 16:11:31 +0200 (CEST)
Received: from localhost ([::1]:45024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFzoQ-0007sS-UN
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 10:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFznN-00075M-ER
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 10:10:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFznJ-0001oA-GU
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 10:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629209419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xRsFWlklVQqvUiOCN7ik3ypZA4/0cojEdWycpyAGS28=;
 b=W7Y0ipNrpaFwKavdRpfw67DowAGuUIS8VTYz7SzeKJpdw5BOjlRqiY8QCbf5i+ckmU5Iet
 ML10bPUTuto1CXaM6htSVHbnjq3dYUE6s0aZp7J8YcVoxpFCclPsW+qKzKiI9+m+I8Xb+r
 8687rL7agEudDYSJXkf8Y/u6DdZNsWk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-EPy2vZviPuOBfAS9Ikk6WQ-1; Tue, 17 Aug 2021 10:10:18 -0400
X-MC-Unique: EPy2vZviPuOBfAS9Ikk6WQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 j33-20020a05600c1c21b02902e6828f7a20so814944wms.7
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 07:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xRsFWlklVQqvUiOCN7ik3ypZA4/0cojEdWycpyAGS28=;
 b=RiOkjlP7m0r9XTKXkflWMnOjUIsqn8jOvZiqZiWKnGg/2Qsn9Q/6OoQrnpOavRk/dY
 4uZEvIvDOcBCoJnseSlC4aOc5MR7uCerhDSCoce+w9GtuWkrPbj4LR/oFd4+iCcJ2J32
 ZwF1hNnn7aYDqlh3RliKWR7F/0T1BIF6KsmRTd1WdDYksabrmPP5anS692h4hctkpUtr
 oHaCAkOXiA2vWvr7dUCoUNoIGRjfsY5QIciwM5+qc37b00fN1vV+GB3SuSkvv2DV8Tyz
 JRBNYzstqZlq8OElVXW+Kk8l5IIeTPj706TpqimOZpjxy4ukgAu71dQXkptLdAp9GJ9R
 DQVA==
X-Gm-Message-State: AOAM533w925zRT0vZsOuksRkFUNQ+ZPkCzjGsKRRNM51FKs6MLmEx4nK
 k+1cpUjt/3rOi5fYjvsjVxAv08cojhg94zJAIuHhyLDGX+sdf1fOtzw30rpT51qqoCUjrVrWMei
 hAs6YxyFms/4EpMU=
X-Received: by 2002:a5d:4bd0:: with SMTP id l16mr4554971wrt.246.1629209416921; 
 Tue, 17 Aug 2021 07:10:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJym2yZ9svzzlnZbSpAVDdGMTz+Fa8WtCANtgy1zwPcVtlBDWDlFDEXE3kl8Lu2YY4sMZNkWRA==
X-Received: by 2002:a5d:4bd0:: with SMTP id l16mr4554943wrt.246.1629209416683; 
 Tue, 17 Aug 2021 07:10:16 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id g11sm2653464wrd.97.2021.08.17.07.10.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 07:10:16 -0700 (PDT)
Subject: Re: [PATCH 2/2] hw/9pfs: use g_autofree in v9fs_walk() where possible
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <cover.1629208359.git.qemu_oss@crudebyte.com>
 <b51670d2a39399535a035f6bc77c3cbeed85edae.1629208359.git.qemu_oss@crudebyte.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <22590757-29f3-3cd5-e239-abe9c7b67f13@redhat.com>
Date: Tue, 17 Aug 2021 16:10:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b51670d2a39399535a035f6bc77c3cbeed85edae.1629208359.git.qemu_oss@crudebyte.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/21 3:46 PM, Christian Schoenebeck wrote:
> Suggested-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


