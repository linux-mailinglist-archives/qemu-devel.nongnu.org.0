Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763E253B665
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 11:53:54 +0200 (CEST)
Received: from localhost ([::1]:35846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwhWa-0008MN-1D
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 05:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwhTn-0007aW-Hg
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 05:50:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwhTl-0003gn-E5
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 05:50:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654163456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s/LzHBVrwlnXLGS6CtgQ+k8rYzsDEdxq+JZP+FYz+QY=;
 b=g1MrJVPhF5yi399sDz/GGQdw0HbJkmuRjLDnByhPaWAKjDSF7I4wuueE4WvqJt8aujMrF6
 Zl1Ww2wlI9r/ePBDKSIjgmvkEqIUrnEdfIMY0Y0Ffji7QEe11ZarV0rpvW4I9l9MiQ49Kl
 GdRAHhEDH7JWDiGkVQBqHQYasMmo848=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-T_oaASdINPG_dRT-TuJakw-1; Thu, 02 Jun 2022 05:50:55 -0400
X-MC-Unique: T_oaASdINPG_dRT-TuJakw-1
Received: by mail-wm1-f71.google.com with SMTP id
 m31-20020a05600c3b1f00b003973a563605so2159723wms.9
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 02:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s/LzHBVrwlnXLGS6CtgQ+k8rYzsDEdxq+JZP+FYz+QY=;
 b=12npuLd5JnUxVbGURo9RXk+E4MUCSCAVtkqeHBgu6F8AXhcFy9h8w6aXKJ141TUcBF
 /Q5Px1lmHlNgZi4nAS1LEqZOZtv20aggByigXaocDOcZSJo6l26meBcT2PmgFkeBF4Az
 aBetTKQVmdT/wX69BY5yKlWyDJMYAcEtyliZJFQVwbeBvwKNIkwhhAeTYGN9NFVyJykE
 FCoNnfNrb9WabnU6nEfvBUs3PKlds3LrxBEPlKC0FKXdlWhTOSl3zRmlzwhghDUwM1l+
 OntcguuctQ1IGD7KJc8m8/ityROHqiyl3lp4UKD/tQ0LUsh5ju6lL4HvNcprlAQ9nOci
 dVpA==
X-Gm-Message-State: AOAM533oq8vmmjrfCuXfbva19PTdYIb0wrCU+pY/vA54lEEZlOJl+8zf
 jil9TUmF1FFhYr7c3F8Crnn04G/TBDT1trahHRMZYWHxDjYkDz4QqF5htMAXJUUm0g9KjR8Mnar
 HyWrRB2hnSOmQ968=
X-Received: by 2002:a1c:c917:0:b0:399:26af:3d47 with SMTP id
 f23-20020a1cc917000000b0039926af3d47mr23889246wmb.143.1654163453915; 
 Thu, 02 Jun 2022 02:50:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjUnCVCAIfCLjCpBhdzt80Lu73cYP8FBQuGonsVY+6PvKnKMUWBeYNj5sup3L6qPDtvSEaBA==
X-Received: by 2002:a1c:c917:0:b0:399:26af:3d47 with SMTP id
 f23-20020a1cc917000000b0039926af3d47mr23889233wmb.143.1654163453718; 
 Thu, 02 Jun 2022 02:50:53 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-51.web.vodafone.de.
 [109.43.179.51]) by smtp.gmail.com with ESMTPSA id
 r12-20020a05600c2c4c00b0039750c29cf7sm4512477wmg.40.2022.06.02.02.50.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 02:50:53 -0700 (PDT)
Message-ID: <6fedf5ab-a156-255d-9ee0-766e165b4be2@redhat.com>
Date: Thu, 2 Jun 2022 11:50:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] Remove Colin Xu's mail address from QEMU's MAINTAINERS
 files
Content-Language: en-US
To: "Wang, Wenchao" <wenchao.wang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: haxm-team <haxm-team@intel.com>
References: <20220602092337.235765-1-thuth@redhat.com>
 <DM6PR11MB40905093667839742D4C600C87DE9@DM6PR11MB4090.namprd11.prod.outlook.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <DM6PR11MB40905093667839742D4C600C87DE9@DM6PR11MB4090.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/06/2022 11.41, Wang, Wenchao wrote:
> Hi, Thomas,
> 
> Thanks for your mail. I once submitted the below patch to qemu-devel@nongnu.org but it has not been merged. I have pasted it as below and attached it in loop. Thanks.

Ah, great, so there is already a patch - then please disregard mine. And if 
nobody else wants to queue this, I can pick it up for my next pull request.

  Thanks,
   Thomas


