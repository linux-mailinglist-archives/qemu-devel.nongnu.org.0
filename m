Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14246D4DF1
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 18:33:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjN5R-0002lO-CB; Mon, 03 Apr 2023 12:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pjN5O-0002Rh-8D
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:31:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pjN5M-0008Am-3z
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:31:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680539471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jihaNIoWcktSMmpT2PwVhpNil8szS7Q4AKSzM3Z7dVw=;
 b=azFohevIiZnHmSzNGZfT9cilYMs6dZFubKtcawMqIbKTNDhheH4wwxhLKq/piIcb+Fw962
 cnBwJ9rG8phWmA9y9gq+YqOfxl0kNIl9wcW8ooTMfA4zdlEABEQAnDssDZngTGKfeWbt5Q
 QvgwSEbS+S6tSlNBYv8zwTAAE5BcfOQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-kyvHHUQLNCqmvV6ZPphWMg-1; Mon, 03 Apr 2023 12:31:08 -0400
X-MC-Unique: kyvHHUQLNCqmvV6ZPphWMg-1
Received: by mail-qk1-f198.google.com with SMTP id
 s21-20020a05620a0bd500b0074234f33f24so13215507qki.3
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 09:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680539468;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jihaNIoWcktSMmpT2PwVhpNil8szS7Q4AKSzM3Z7dVw=;
 b=cfXbTwweIiCBB7QA92g7BGNN9x7pBPgkUK+MNqT5f2EWTLsBzqjcf7gGmlQV7GysJT
 KvU+1NTYgT14Z+oPkZfzgO0RtegRsQ4i06Z1RM1OVNHPKvp1l7DvHGiB82QfVCDnvJVm
 7XPQq/W1VHKdhL11JXuQJyyENtUynN2j7fVHWD0UUF9kRzU+ilrrK4UoSnBSAAtxtIec
 EJYjgmYDjsfJP4B+ryGEmvJcYU0oUT/tUmkfd8RLqzaPYpXeoGV0Cbtwd0nHC61vcRzF
 WV9jkSpm1hJruHwNGB5g+4BdBmyJ555Mnaz+Gsz1HzWmpj+Yrmxdvohrbc7P6aU0tjbn
 Wl5g==
X-Gm-Message-State: AAQBX9fPLFGmcvxdOzRbUhYYArUd6PD3POzsk4/XvqY2Gk4b+0c5VHZf
 K49DGdeoUM6bHbj7dCjMlkulsp5RQLTPEgiiMXT14QsapO2PHKzYhnx2NLj6e/40TGO5iOULVbz
 5zJzpMx3ZCt4qg+s=
X-Received: by 2002:ad4:5967:0:b0:5e0:7ecb:8ff3 with SMTP id
 eq7-20020ad45967000000b005e07ecb8ff3mr26674431qvb.47.1680539467822; 
 Mon, 03 Apr 2023 09:31:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yz3TmGaI2BspKLmJMBpmerhzSItPl66TwFcUWLKwNI268XPvIMoIZBcs7paPjkZeq3iJyy8Q==
X-Received: by 2002:ad4:5967:0:b0:5e0:7ecb:8ff3 with SMTP id
 eq7-20020ad45967000000b005e07ecb8ff3mr26674404qvb.47.1680539467537; 
 Mon, 03 Apr 2023 09:31:07 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-12.web.vodafone.de.
 [109.43.177.12]) by smtp.gmail.com with ESMTPSA id
 mm17-20020a0562145e9100b005dd8b9345f4sm2689720qvb.140.2023.04.03.09.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 09:31:07 -0700 (PDT)
Message-ID: <21d10332-f109-15aa-b282-bc31c07b364c@redhat.com>
Date: Mon, 3 Apr 2023 18:31:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 04/11] qemu-options: finesse the recommendations around
 -blockdev
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>,
 Ryo ONODERA <ryoon@netbsd.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-5-alex.bennee@linaro.org> <871ql1lc2z.fsf@pond.sub.org>
 <87mt3pm6tf.fsf@linaro.org> <871ql19fs4.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <871ql19fs4.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.349, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 03/04/2023 16.55, Markus Armbruster wrote:
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
>> Markus Armbruster <armbru@redhat.com> writes:
>>
>>> Alex Bennée <alex.bennee@linaro.org> writes:
...
>> I was under the impression things like -hda wouldn't work say on an Arm
>> machine because you don't know what sort of interface you might be
>> using and -hda implies IDE. Where is this macro substitution done?
> 
> qemu_init() calls drive_add() for all these options.
> 
> drive_add(TYPE, INDEX, FILE, OPTSTR) creates a QemuOpts in group
> "drive".  It sets "if" to if_name[TYPE] unless TYPE is IF_DEFAULT,
> "index" to INDEX unless it's negative, and "file" to FILE unless it's
> null.  Then it parses OPTSTR on top.
> 
> For -hdX, the call looks like
> 
>                  drive_add(IF_DEFAULT, popt->index - QEMU_OPTION_hda, optarg,
>                            HD_OPTS);
> 
> We pass IF_DEFAULT, so "if" remains unset.  "index" is set to 0 for
> -hda, 1, for -hdb and so forth.  "file" is set to the option argument.
> Since HD_OPTS is "media=disk", we set "media" to "disk".
> 
> The QemuOpts in config group "drive" get passed to drive_new() via
> drive_init_func().  Unset "if" defaults to the current machine's class's
> block_default_type.
> 
> If a machine doesn't set this member explicitly, it remains zero, which
> is IF_NONE.  Documented in blockdev.h:
> 
>      typedef enum {
>          IF_DEFAULT = -1,            /* for use with drive_add() only */
>          /*
>           * IF_NONE must be zero, because we want MachineClass member
> --->     * block_default_type to default-initialize to IF_NONE
>           */
>          IF_NONE = 0,
>          IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO, IF_XEN,
>          IF_COUNT
>      } BlockInterfaceType;
> 
> Questions?

How's the average user supposed to know that? Our qemu-options.hx just says: 
"-hda/-hdb file  use 'file' as IDE hard disk 0/1 image"...

  Thomas


