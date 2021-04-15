Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C55360556
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 11:12:29 +0200 (CEST)
Received: from localhost ([::1]:44402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWy33-000315-1F
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 05:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWy1q-00027W-QX
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 05:11:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWy1p-0006VU-DL
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 05:11:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618477872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PR/HMe9WISZqN7ICHQnFlEUDruTDuU/HPpneZbjHvvg=;
 b=i6+NpvZF072BDL/voyq4gd2MTaWEBwuTkHE+qM7UcprCJFt6PryaIBY44lVJc2lXJRjmgb
 3u77/rXhcVFUEqgrccrL9UA+ftTyZpKE8K5mCXU2FOG2GkMNQxhxMLqQiUQCNf+pvKSubU
 Up8oYIQk5bCmeoRZZeoqXO1KklCUMs4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-_nm3H4JBMhqGrLPfXcb4eg-1; Thu, 15 Apr 2021 05:11:11 -0400
X-MC-Unique: _nm3H4JBMhqGrLPfXcb4eg-1
Received: by mail-wr1-f72.google.com with SMTP id
 h60-20020adf90420000b029010418c4cd0cso1579472wrh.12
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 02:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PR/HMe9WISZqN7ICHQnFlEUDruTDuU/HPpneZbjHvvg=;
 b=JyYByeMFEmG3OCSDgqmyHCUg+0X9sfHO4Y52rKeOZUY8jSkZw4oedazhTuwJgiL3DJ
 SsbS+hJPNIyvQjVimGCzn+/n51nSs9s6Ol0X6WM9Ji9MtY6B/YNVi2mCai5OXicHa2Qp
 pCNE+XkBu/qGMJ7cRtIjRWDunqes00JhBrebJY6NmT+31DcbN+rwGQ3OEjlvlrmhntG4
 36MoDq+lGxbDV/BDD9+53XeUoFitloYlGzWbrV93yhmAxLil7VkS7iDSQXGi7PPhB72C
 Jc2LIUUlNCBBOvnWXozopjXenXF9RjObYLZ04Xg+XQ7IzvUkIaU5xZOscjcMCuNrV0EH
 IC8g==
X-Gm-Message-State: AOAM5338UKzFFXV9fks1AffrS75loJaux8t17ESNj0SLjM9lNK36MRbJ
 QgSDVC0fyDqcJx9xCeP+oSYmTOwSte5i1ysuCGMecl5TVLEjwZku9L4FpbSk2akbBbR/hbqCiWF
 ijimfLJLQGDFKPVE=
X-Received: by 2002:a7b:c201:: with SMTP id x1mr2056684wmi.124.1618477870028; 
 Thu, 15 Apr 2021 02:11:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfBeSzTgaA/TSp1hXgbwLkGNIPLBkKsjewCMEQyh/yhn5sVL7TQkxFIxCTeoQEpKYaoaD8lw==
X-Received: by 2002:a7b:c201:: with SMTP id x1mr2056667wmi.124.1618477869875; 
 Thu, 15 Apr 2021 02:11:09 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id a72sm1673946wme.29.2021.04.15.02.11.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 02:11:09 -0700 (PDT)
Subject: Re: [PATCH 0/3] Acceptance Tests: support choosing specific distro
 and version
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210414221457.1653745-1-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <62808682-d7f6-7af7-b4fe-b1b4c6a69e1d@redhat.com>
Date: Thu, 15 Apr 2021 11:11:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414221457.1653745-1-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 12:14 AM, Cleber Rosa wrote:
> Cleber Rosa (3):
>   Acceptance Tests: rename attribute holding the distro image checksum
>   Acceptance Tests: move definition of distro checksums to the framework
>   Acceptance Tests: support choosing specific distro and version
> 
>  docs/devel/testing.rst                    | 65 ++++++++++++++++++++++
>  tests/acceptance/avocado_qemu/__init__.py | 67 +++++++++++++++++++++--
>  tests/acceptance/boot_linux.py            |  8 ---
>  3 files changed, 127 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


