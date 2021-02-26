Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE499326675
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 18:48:41 +0100 (CET)
Received: from localhost ([::1]:47084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFhEG-00026s-EJ
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 12:48:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFhCg-0001Z0-6B
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 12:47:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFhCc-0007Rz-1a
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 12:47:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614361606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZAKTetoQVUNXwGdC6aeuomPxKavcmYdZc7WTdbKDW1o=;
 b=ZpDm3GAryKzzgaoEph5knr9UxP7U18P7TY+4IvJXXpIfE/7NfNmoYhmO1WfRK7uaBfCNUn
 0XynY0Iad9QS2pn856xxaG4u3BNYeakDG0lXYm11yyzmLpCusEkhBB3WkDIwzPLZ1pkVO+
 Zp/0Clq7w3scg0Pqc2W347n/GUtIUW0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-TQYVddohPy2HScpZ5x3AoQ-1; Fri, 26 Feb 2021 12:46:44 -0500
X-MC-Unique: TQYVddohPy2HScpZ5x3AoQ-1
Received: by mail-wr1-f72.google.com with SMTP id b7so5205747wrv.7
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 09:46:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZAKTetoQVUNXwGdC6aeuomPxKavcmYdZc7WTdbKDW1o=;
 b=f9NPUOT5Vh6to0RdeAbi97vqR2NCR4cIkt+GLZ53dZ2QSwApd8UJw6+WbpaSYgtJ8v
 iHCZviUmCa3y9Zb/2+j6eEGM+bn+5gUSjbOgXaUmHptHlsS0N38KpPXzB/2CCFIPdjwq
 q6QfsiO0dAXTugO2etbfVSjrTSli3qlz0tg1ejv4T7j1nKti5DRQ9/on9Mgwm81FNTSt
 oPYjZ2ADizuig9/OYSQkFJcEyfyxh7AY/XB2f2G+qVJROHiob/LcXc2zU9FBF+MlX8Og
 pLJcAWmkq+ur+DadhWLkzpQA/IdZ2iKs/0klhuBbqUkQqaNv9SDkCcQ5LXlccVYmMOfO
 N7Ug==
X-Gm-Message-State: AOAM5317EBIeivyNQbRTwNgbBPLkou3hWPl7sNMZfPJ3qv0uR12JZblw
 HP4OWkB3PJOIGtfbMUHHjt7B7he+a0iCIpWMU292n0HOQ2nSdpmDBgpKVGHXzCxwKWRihbgQfNl
 R3qxCJpb616rRjIg=
X-Received: by 2002:a7b:cc0c:: with SMTP id f12mr3929696wmh.137.1614361603716; 
 Fri, 26 Feb 2021 09:46:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOP9ci6zp2wZIiuVvS9QVao4xhy39+BvLVnth8ImziBKauDSn7QBJ1P0AFrQ80OXEvYUytJA==
X-Received: by 2002:a7b:cc0c:: with SMTP id f12mr3929687wmh.137.1614361603552; 
 Fri, 26 Feb 2021 09:46:43 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u63sm7964681wmg.24.2021.02.26.09.46.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 09:46:43 -0800 (PST)
Subject: Re: [PATCH v2] qemu-config: add error propagation to qemu_config_parse
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210226170816.231173-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6c4a4697-60b8-a327-f3af-60dfe682c7d4@redhat.com>
Date: Fri, 26 Feb 2021 18:46:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210226170816.231173-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 6:08 PM, Paolo Bonzini wrote:
> This enables some simplification of vl.c via error_fatal, and improves
> error messages.  Before:
> 
> Before:
>   $ ./qemu-system-x86_64 -readconfig .
>   qemu-system-x86_64: error reading file
>   qemu-system-x86_64: -readconfig .: read config .: Invalid argument
>   $ /usr/libexec/qemu-kvm -readconfig foo
>   qemu-kvm: -readconfig foo: read config foo: No such file or directory
> 
> After:
> 
>   $ ./qemu-system-x86_64 -readconfig .
>   qemu-system-x86_64: -readconfig .: error reading file: Is a directory
>   $ ./qemu-system-x86_64 -readconfig foo
>   qemu-system-x86_64: -readconfig foo: Cannot read config file foo: No such file or directory
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/blkdebug.c           |  3 +--
>  include/qemu/config-file.h |  5 +++--
>  softmmu/vl.c               | 29 +++++++++++------------------
>  util/qemu-config.c         | 23 ++++++++++++-----------
>  4 files changed, 27 insertions(+), 33 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


