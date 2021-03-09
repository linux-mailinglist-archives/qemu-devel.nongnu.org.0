Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3883325A4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:43:48 +0100 (CET)
Received: from localhost ([::1]:53700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbiF-0002n9-NQ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:43:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJbAm-0007Se-AM
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:09:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJbAk-0005Pz-1s
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615291749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c/lhUIJlNm42EEudRUeTM3sJ7JhM0FwsGm0YJku6krs=;
 b=P88p+eKM5/KlggfQWoXK2q3WSqHu5nUDsquePXLDwnA/A9t2QcEmUVCRDtQ+cvHknc7TDa
 mB2coy95b8hZqhSwTGKUTFR0RRskPeYnBTTzgS0pK5aAoQ5MDF3aPWWIZwIS7c3kbAwtqt
 d/tuxE+ix5z2K2mzOanDvX5AgjDjHw4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-dFEttBZCOo2oizlHDtPVWQ-1; Tue, 09 Mar 2021 07:09:04 -0500
X-MC-Unique: dFEttBZCOo2oizlHDtPVWQ-1
Received: by mail-wm1-f72.google.com with SMTP id c7so1040021wml.8
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 04:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c/lhUIJlNm42EEudRUeTM3sJ7JhM0FwsGm0YJku6krs=;
 b=P4EDvBcOcU+m0X4D7zHJVtSOa1k+MEjlZNqZfuzmjc7Wb1AX9NtdFxb9SQzbS139li
 /3N4fR6je6xlOW6th3qtnJzBf28npRwHYAVWiubfJtn2LcBzmNx+ulHVlbJPGug/fiDF
 w27o65qXo7y2XqPnr9yxMEBwa7ykCNMlO/G+Q1CH4eQgONnkrrLnVp2aO8INm0ejFnU6
 KAZetMpaqcZdTnmbGOPyq6YaFfrRkqSun/DxdckbcW6H81WqrWcVtSdIVRHTGulD9PFK
 n08mQzxyGW9ZW3cZjihoY4AmGbkckWrG+8m/0gT9ObQTdjNAmCPcdzLxrdY15A6OP4R/
 5t/w==
X-Gm-Message-State: AOAM530TI35uutEGr8RProYNgfScJ99pG04AS4FrsAV0HnpFr7ShA9yt
 dIIqIczHOuaGVeQkmEsuiOaGI6dJnaPRIL+dBjPKYKv1CXsesuAQq5ti9NG7uePz6SBS3oFwmbH
 FnvKddy6ZzSO8egs=
X-Received: by 2002:adf:f148:: with SMTP id y8mr27177792wro.107.1615291743514; 
 Tue, 09 Mar 2021 04:09:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybGShOw9okcVgb+PFcrKuKk33mv5jJ8iUP+Gtk+cNM+OSAJynGEVdMC0Ns1GpPzqtbm+YSNA==
X-Received: by 2002:adf:f148:: with SMTP id y8mr27177784wro.107.1615291743411; 
 Tue, 09 Mar 2021 04:09:03 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q4sm4033703wma.20.2021.03.09.04.09.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 04:09:03 -0800 (PST)
Subject: Re: [PATCH v2 2/4] block: check for sys/disk.h
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org
References: <20210309002741.85057-1-j@getutm.app>
 <20210309002741.85057-3-j@getutm.app>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9062f9f2-a287-d51b-84c1-ebf5193df803@redhat.com>
Date: Tue, 9 Mar 2021 13:09:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309002741.85057-3-j@getutm.app>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 1:27 AM, Joelle van Dyne wrote:
> Some BSD platforms do not have this header.
> 
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  meson.build | 1 +
>  block.c     | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 0e53876f69..ba0db9fa1f 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1153,6 +1153,7 @@ config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
>  config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
>  config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
>  config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
> +config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


