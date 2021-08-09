Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7683E4431
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 12:51:16 +0200 (CEST)
Received: from localhost ([::1]:47118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD2sF-00037u-GW
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 06:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mD2o0-0005V5-Lf
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:46:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mD2ny-0001Vg-TK
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628506010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJoWwTt18CjNgsWkVoh+hRmqDKEk5blUqBBY045APAM=;
 b=aIAd1rSx4FrKafUEihdVwpAeZD/x3WPVicO8Z+qWKdNom8oFheP78zfwb3Ly6wR6dYyBBf
 c64oMYAlbc2Ng9ibUzFIZ9WRsUB8/Yx29E4WQD9XqlHPje4+3xo5r7vlLZusZUU2SM/kcs
 LtTK9n3o2nFbP2MVIAMO7FrhH3l6TM0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-ncxUDkqSOBCHViSvH9C7sA-1; Mon, 09 Aug 2021 06:46:49 -0400
X-MC-Unique: ncxUDkqSOBCHViSvH9C7sA-1
Received: by mail-wm1-f70.google.com with SMTP id
 y6-20020a1c7d060000b02902e6946a8d1fso648637wmc.9
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 03:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qJoWwTt18CjNgsWkVoh+hRmqDKEk5blUqBBY045APAM=;
 b=IxsqMzdXbVfdeVq55w+CljMAz6hFkDWT7guGckUj1FW+v+UGGOuApybbFUncujiuqh
 p0RJWQWFQUigMrUX9V8bAZGXUruDFnHnO9htVk61zJLjBauU4dxjGpUS1/VgYD+0fd6A
 +W0MOM9XnXz9bhcMqcuLPmqxuOZNHzLAYajsSj4lTVQmhPE/sBoTg/cA43xKmsrRzPLl
 tUkxOqfgXIB68frE92jh3uZqcEq3pAPx+DGxKlrT+hXvLC2w9KjsFqfUsrFUbHTTdM1q
 oH2w7iTSc4aGVyU9vEKNE/u1NZXrkw3o4pmCUw0ffLNIAcJDTUT0Ttd39NPDsEFtOdCz
 f2Gg==
X-Gm-Message-State: AOAM530eAI70Htwd1y78jYOLmOXH9bDep7HYOaX8OQ+1BNbuqbdxL+8Z
 xmnKkFcx381ya21O8lJUQdZltocI7jhUL4OFH7MZHeFVp2g6i+wyINQpTtwVcJvkynpLRxfpLv6
 YmSAILaa+dpnmK7E=
X-Received: by 2002:adf:fc0d:: with SMTP id i13mr23491523wrr.276.1628506007813; 
 Mon, 09 Aug 2021 03:46:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxexzFPqB8Y0eKOk7Zn0xTsFK/9IFseHCnPlIu7Eui+BGoe80tM+4FkLAVDqsK2gdc2UmRWcA==
X-Received: by 2002:adf:fc0d:: with SMTP id i13mr23491512wrr.276.1628506007592; 
 Mon, 09 Aug 2021 03:46:47 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id j6sm4936579wms.44.2021.08.09.03.46.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 03:46:47 -0700 (PDT)
Subject: Re: [RFC 3/4] gqa-win: get_pci_info: Add g_autofree for few variables
To: Kostiantyn Kostiuk <konstantin@daynix.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210809094839.52312-1-konstantin@daynix.com>
 <20210809094839.52312-3-konstantin@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <007231ff-bc43-50c2-9bd9-1becfbdf2281@redhat.com>
Date: Mon, 9 Aug 2021 12:46:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809094839.52312-3-konstantin@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Matt Hines <mhines@scalecomputing.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kostiantyn,

On 8/9/21 11:48 AM, Kostiantyn Kostiuk wrote:
> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>

I'm not sure what you are trying to do here, fix a memory leak?

> ---
>  qga/commands-win32.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 724ce76a0e..a8a601776d 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -539,9 +539,9 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
>      dev_info_data.cbSize = sizeof(SP_DEVINFO_DATA);
>      dev_iface_data.cbSize = sizeof(SP_DEVICE_INTERFACE_DATA);
>      for (i = 0; SetupDiEnumDeviceInfo(dev_info, i, &dev_info_data); i++) {
> -        PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_iface_detail_data = NULL;
> +        g_autofree PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_iface_detail_data = NULL;
>          STORAGE_DEVICE_NUMBER sdn;
> -        char *parent_dev_id = NULL;
> +        g_autofree char *parent_dev_id = NULL;
>          HDEVINFO parent_dev_info;
>          SP_DEVINFO_DATA parent_dev_info_data;
>          DWORD j;
> 

Anyhow this function is confuse.

I think it would be easier to review by replacing the while()
by 2 calls, as suggested in the documentation:
https://docs.microsoft.com/en-us/windows/win32/api/setupapi/nf-setupapi-setupdigetdeviceinterfacedetaila

-- >8 --
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 7bac0c5d422..2188c5dd80d 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -539,7 +539,6 @@ static GuestPCIAddress *get_pci_info(int number,
Error **errp)
     dev_info_data.cbSize = sizeof(SP_DEVINFO_DATA);
     dev_iface_data.cbSize = sizeof(SP_DEVICE_INTERFACE_DATA);
     for (i = 0; SetupDiEnumDeviceInfo(dev_info, i, &dev_info_data); i++) {
-        PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_iface_detail_data = NULL;
         STORAGE_DEVICE_NUMBER sdn;
         char *parent_dev_id = NULL;
         HDEVINFO parent_dev_info;
@@ -551,25 +550,36 @@ static GuestPCIAddress *get_pci_info(int number,
Error **errp)
         if (SetupDiEnumDeviceInterfaces(dev_info, &dev_info_data,
                                         &GUID_DEVINTERFACE_DISK, 0,
                                         &dev_iface_data)) {
-            while (!SetupDiGetDeviceInterfaceDetail(dev_info,
&dev_iface_data,
-                                                    pdev_iface_detail_data,
-                                                    size, &size,
-                                                    &dev_info_data)) {
-                if (GetLastError() == ERROR_INSUFFICIENT_BUFFER) {
-                    pdev_iface_detail_data = g_malloc(size);
-                    pdev_iface_detail_data->cbSize =
-                        sizeof(*pdev_iface_detail_data);
-                } else {
-                    error_setg_win32(errp, GetLastError(),
-                                     "failed to get device interfaces");
-                    goto free_dev_info;
-                }
+            g_autofree PSP_DEVICE_INTERFACE_DETAIL_DATA
+                       pdev_iface_detail_data = NULL;
+
+            /* Get the required buffer size. */
+            if (!SetupDiGetDeviceInterfaceDetail(dev_info, &dev_iface_data,
+                                                 NULL, 0, &size,
+                                                 &dev_info_data)
+                    && GetLastError() != ERROR_INSUFFICIENT_BUFFER) {
+                error_setg_win32(errp, GetLastError(),
+                                 "failed to get device interfaces
buffer size");
+                goto free_dev_info;
+            }
+
+            /* Allocate an appropriately sized buffer. */
+            pdev_iface_detail_data = g_malloc(size);
+            pdev_iface_detail_data->cbSize =
sizeof(*pdev_iface_detail_data);
+
+            /* Get the interface details. */
+            if (!SetupDiGetDeviceInterfaceDetail(dev_info, &dev_iface_data,
+                                                 pdev_iface_detail_data,
+                                                 size, &size,
+                                                 &dev_info_data)) {
+                error_setg_win32(errp, GetLastError(),
+                                 "failed to get device interfaces");
+                goto free_dev_info;
             }

             dev_file = CreateFile(pdev_iface_detail_data->DevicePath, 0,
                                   FILE_SHARE_READ, NULL, OPEN_EXISTING, 0,
                                   NULL);
-            g_free(pdev_iface_detail_data);

             if (!DeviceIoControl(dev_file, IOCTL_STORAGE_GET_DEVICE_NUMBER,
                                  NULL, 0, &sdn, sizeof(sdn), &size,
NULL)) {
---


