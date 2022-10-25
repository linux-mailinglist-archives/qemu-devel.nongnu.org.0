Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260F560D195
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:25:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMhL-0000i8-EN; Tue, 25 Oct 2022 12:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onMhJ-0000ZV-DR
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:22:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onMhF-0006aM-WC
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:22:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666714952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5BckSLziwQDnUcGtQjrmCJSE747tllrqYl2iaNqh7/E=;
 b=gSa3xg72SmNjR/TKs/mTfXqwIKYle9AQbMNE2WcpDWKe7Nc539kqGpz16T9mOKUHD5oBgq
 FlFRATpmNHh2qZaf6gB8ceONt7AXDQZx0/IhSKd4+WGbqNmYfXC8Guq5tpPkLWA27sdGaY
 R36x/9MaFwX4bqLV+k7ssKhTahufJh4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-63-9Pk-CetVOjSh0CL8vWXjAw-1; Tue, 25 Oct 2022 12:22:31 -0400
X-MC-Unique: 9Pk-CetVOjSh0CL8vWXjAw-1
Received: by mail-wr1-f72.google.com with SMTP id
 m24-20020adfa3d8000000b00236774fd74aso2225971wrb.8
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5BckSLziwQDnUcGtQjrmCJSE747tllrqYl2iaNqh7/E=;
 b=jyD28f515Zh4MJA+M4hgjJ8MS5NLRd1jG0T7HAxGl5LFG7YcV4Eqe3YK7jejb2LTl9
 ePFSerWTQ5EklozK6YZn7KDTqlmeucYRmCkkgpodZGpAV86P90ulF1+yK3d9+1XaMUqp
 0lx8ZwCIFL73B4UyX8sphO1ZXMIW8eowgJnJW+tj6rCThEFYr2TQcJLTIghF9snHxae8
 h22jplj45RUWEd9/UJ22CRSR8QVASVkVxLgXp28dxm2J1hn28ALnTE577cMEcEfYnZbp
 10UPn8tXzh6VCC7thfWlBXK5U/lmRpF7v4yCay50t/PfHb9sQ9T0T6rY+2pehJfqnQHB
 mBOA==
X-Gm-Message-State: ACrzQf1/Op3NHmwMsDM7yvysWporUns3ac5K8SjPlJSBJV5AGUSC6kRN
 LSlNkeE3VfVC7H3IDGUbe9pAx//oMwXkteXIbXhIQZTOTPpQpzyL1DQywGnZfO4uFaXdBbvXiG8
 HKmz03Wj9GcTrBJg=
X-Received: by 2002:a05:600c:474a:b0:3c7:198a:dbfd with SMTP id
 w10-20020a05600c474a00b003c7198adbfdmr16922217wmo.135.1666714950241; 
 Tue, 25 Oct 2022 09:22:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM525fEJYfeAQ9holON7GAxqcs4ht06POxk1Gn2hMnwIIfg2Trd4J/wFewgyzh1mgUG6hGqZgA==
X-Received: by 2002:a05:600c:474a:b0:3c7:198a:dbfd with SMTP id
 w10-20020a05600c474a00b003c7198adbfdmr16922206wmo.135.1666714949975; 
 Tue, 25 Oct 2022 09:22:29 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-58.web.vodafone.de.
 [109.43.176.58]) by smtp.gmail.com with ESMTPSA id
 k21-20020a05600c0b5500b003cdf141f363sm2901776wmr.11.2022.10.25.09.22.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 09:22:29 -0700 (PDT)
Message-ID: <52cab5c6-ffa8-93fa-7080-e8d0fa7a5729@redhat.com>
Date: Tue, 25 Oct 2022 18:22:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 4/4] hw/usb: fix tab indentation
Content-Language: en-US
To: Amarjargal Gundjalam <amarjargal16@gmail.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, berrange@redhat.com, vr_qemu@t-online.de
References: <cover.1666707782.git.amarjargal16@gmail.com>
 <6c993f57800f8fef7a910074620f6e80e077a3d1.1666707782.git.amarjargal16@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <6c993f57800f8fef7a910074620f6e80e077a3d1.1666707782.git.amarjargal16@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 25/10/2022 16.28, Amarjargal Gundjalam wrote:
> The TABs should be replaced with spaces, to make sure that we have a
> consistent coding style with an indentation of 4 spaces everywhere.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/370
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> Signed-off-by: Amarjargal Gundjalam <amarjargal16@gmail.com>
> ---
>   hw/usb/dev-hub.c           |   82 +-
>   hw/usb/dev-network.c       |  286 +++----
>   hw/usb/dev-wacom.c         |    4 +-
>   hw/usb/hcd-musb.c          |  328 ++++----
>   hw/usb/quirks-pl2303-ids.h |  180 ++--
>   include/hw/usb.h           |  100 +--
>   include/hw/usb/dwc2-regs.h | 1608 ++++++++++++++++++------------------
>   7 files changed, 1294 insertions(+), 1294 deletions(-)
> 
> diff --git a/hw/usb/dev-hub.c b/hw/usb/dev-hub.c
> index e35813d772..a6b50dbc8d 100644
> --- a/hw/usb/dev-hub.c
> +++ b/hw/usb/dev-hub.c
> @@ -54,44 +54,44 @@ struct USBHubState {
>   #define TYPE_USB_HUB "usb-hub"
>   OBJECT_DECLARE_SIMPLE_TYPE(USBHubState, USB_HUB)
>   
> -#define ClearHubFeature		(0x2000 | USB_REQ_CLEAR_FEATURE)
> -#define ClearPortFeature	(0x2300 | USB_REQ_CLEAR_FEATURE)
> -#define GetHubDescriptor	(0xa000 | USB_REQ_GET_DESCRIPTOR)
> -#define GetHubStatus		(0xa000 | USB_REQ_GET_STATUS)
> -#define GetPortStatus		(0xa300 | USB_REQ_GET_STATUS)
> -#define SetHubFeature		(0x2000 | USB_REQ_SET_FEATURE)
> -#define SetPortFeature		(0x2300 | USB_REQ_SET_FEATURE)
> -
> -#define PORT_STAT_CONNECTION	0x0001
> -#define PORT_STAT_ENABLE	0x0002
> -#define PORT_STAT_SUSPEND	0x0004
> -#define PORT_STAT_OVERCURRENT	0x0008
> -#define PORT_STAT_RESET		0x0010
> -#define PORT_STAT_POWER		0x0100
> -#define PORT_STAT_LOW_SPEED	0x0200
> +#define ClearHubFeature         (0x2000 | USB_REQ_CLEAR_FEATURE)
> +#define ClearPortFeature        (0x2300 | USB_REQ_CLEAR_FEATURE)
> +#define GetHubDescriptor        (0xa000 | USB_REQ_GET_DESCRIPTOR)
> +#define GetHubStatus            (0xa000 | USB_REQ_GET_STATUS)
> +#define GetPortStatus           (0xa300 | USB_REQ_GET_STATUS)
> +#define SetHubFeature           (0x2000 | USB_REQ_SET_FEATURE)
> +#define SetPortFeature          (0x2300 | USB_REQ_SET_FEATURE)
> +
> +#define PORT_STAT_CONNECTION    0x0001
> +#define PORT_STAT_ENABLE        0x0002
> +#define PORT_STAT_SUSPEND       0x0004
> +#define PORT_STAT_OVERCURRENT   0x0008
> +#define PORT_STAT_RESET         0x0010
> +#define PORT_STAT_POWER         0x0100
> +#define PORT_STAT_LOW_SPEED     0x0200
>   #define PORT_STAT_HIGH_SPEED    0x0400
>   #define PORT_STAT_TEST          0x0800
>   #define PORT_STAT_INDICATOR     0x1000
>   
> -#define PORT_STAT_C_CONNECTION	0x0001
> -#define PORT_STAT_C_ENABLE	0x0002
> -#define PORT_STAT_C_SUSPEND	0x0004
> -#define PORT_STAT_C_OVERCURRENT	0x0008
> -#define PORT_STAT_C_RESET	0x0010
> -
> -#define PORT_CONNECTION	        0
> -#define PORT_ENABLE		1
> -#define PORT_SUSPEND		2
> -#define PORT_OVERCURRENT	3
> -#define PORT_RESET		4
> -#define PORT_POWER		8
> -#define PORT_LOWSPEED		9
> -#define PORT_HIGHSPEED		10
> -#define PORT_C_CONNECTION	16
> -#define PORT_C_ENABLE		17
> -#define PORT_C_SUSPEND		18
> -#define PORT_C_OVERCURRENT	19
> -#define PORT_C_RESET		20
> +#define PORT_STAT_C_CONNECTION  0x0001
> +#define PORT_STAT_C_ENABLE      0x0002
> +#define PORT_STAT_C_SUSPEND     0x0004
> +#define PORT_STAT_C_OVERCURRENT 0x0008
> +#define PORT_STAT_C_RESET       0x0010
> +
> +#define PORT_CONNECTION         0
> +#define PORT_ENABLE             1
> +#define PORT_SUSPEND            2
> +#define PORT_OVERCURRENT        3
> +#define PORT_RESET              4
> +#define PORT_POWER              8
> +#define PORT_LOWSPEED           9
> +#define PORT_HIGHSPEED          10
> +#define PORT_C_CONNECTION       16
> +#define PORT_C_ENABLE           17
> +#define PORT_C_SUSPEND          18
> +#define PORT_C_OVERCURRENT      19
> +#define PORT_C_RESET            20
>   #define PORT_TEST               21
>   #define PORT_INDICATOR          22
>   
> @@ -155,13 +155,13 @@ static const USBDesc desc_hub = {
>   
>   static const uint8_t qemu_hub_hub_descriptor[] =
>   {
> -        0x00,			/*  u8  bLength; patched in later */
> -        0x29,			/*  u8  bDescriptorType; Hub-descriptor */
> -        0x00,			/*  u8  bNbrPorts; (patched later) */
> -        0x0a,			/* u16  wHubCharacteristics; */
> -        0x00,			/*   (per-port OC, no power switching) */
> -        0x01,			/*  u8  bPwrOn2pwrGood; 2ms */
> -        0x00			/*  u8  bHubContrCurrent; 0 mA */
> +        0x00,                   /*  u8  bLength; patched in later */
> +        0x29,                   /*  u8  bDescriptorType; Hub-descriptor */
> +        0x00,                   /*  u8  bNbrPorts; (patched later) */
> +        0x0a,                   /* u16  wHubCharacteristics; */
> +        0x00,                   /*   (per-port OC, no power switching) */
> +        0x01,                   /*  u8  bPwrOn2pwrGood; 2ms */
> +        0x00                    /*  u8  bHubContrCurrent; 0 mA */
>   
>           /* DeviceRemovable and PortPwrCtrlMask patched in later */
>   };
> diff --git a/hw/usb/dev-network.c b/hw/usb/dev-network.c
> index ac1adca543..5fff487ee5 100644
> --- a/hw/usb/dev-network.c
> +++ b/hw/usb/dev-network.c
> @@ -52,7 +52,7 @@
>   #define RNDIS_PRODUCT_NUM       0xa4a2  /* Ethernet/RNDIS Gadget */
>   
>   enum usbstring_idx {
> -    STRING_MANUFACTURER		= 1,
> +    STRING_MANUFACTURER         = 1,
>       STRING_PRODUCT,
>       STRING_ETHADDR,
>       STRING_DATA,
> @@ -64,39 +64,39 @@ enum usbstring_idx {
>       STRING_SERIALNUMBER,
>   };
>   
> -#define DEV_CONFIG_VALUE		1	/* CDC or a subset */
> -#define DEV_RNDIS_CONFIG_VALUE		2	/* RNDIS; optional */
> +#define DEV_CONFIG_VALUE                1       /* CDC or a subset */
> +#define DEV_RNDIS_CONFIG_VALUE          2       /* RNDIS; optional */
>   
> -#define USB_CDC_SUBCLASS_ACM		0x02
> -#define USB_CDC_SUBCLASS_ETHERNET	0x06
> +#define USB_CDC_SUBCLASS_ACM            0x02
> +#define USB_CDC_SUBCLASS_ETHERNET       0x06
>   
> -#define USB_CDC_PROTO_NONE		0
> -#define USB_CDC_ACM_PROTO_VENDOR	0xff
> +#define USB_CDC_PROTO_NONE              0
> +#define USB_CDC_ACM_PROTO_VENDOR        0xff
>   
> -#define USB_CDC_HEADER_TYPE		0x00	/* header_desc */
> -#define USB_CDC_CALL_MANAGEMENT_TYPE	0x01	/* call_mgmt_descriptor */
> -#define USB_CDC_ACM_TYPE		0x02	/* acm_descriptor */
> -#define USB_CDC_UNION_TYPE		0x06	/* union_desc */
> -#define USB_CDC_ETHERNET_TYPE		0x0f	/* ether_desc */
> +#define USB_CDC_HEADER_TYPE             0x00    /* header_desc */
> +#define USB_CDC_CALL_MANAGEMENT_TYPE    0x01    /* call_mgmt_descriptor */
> +#define USB_CDC_ACM_TYPE                0x02    /* acm_descriptor */
> +#define USB_CDC_UNION_TYPE              0x06    /* union_desc */
> +#define USB_CDC_ETHERNET_TYPE           0x0f    /* ether_desc */
>   
> -#define USB_CDC_SEND_ENCAPSULATED_COMMAND	0x00
> -#define USB_CDC_GET_ENCAPSULATED_RESPONSE	0x01
> -#define USB_CDC_REQ_SET_LINE_CODING		0x20
> -#define USB_CDC_REQ_GET_LINE_CODING		0x21
> -#define USB_CDC_REQ_SET_CONTROL_LINE_STATE	0x22
> -#define USB_CDC_REQ_SEND_BREAK			0x23
> -#define USB_CDC_SET_ETHERNET_MULTICAST_FILTERS	0x40
> -#define USB_CDC_SET_ETHERNET_PM_PATTERN_FILTER	0x41
> -#define USB_CDC_GET_ETHERNET_PM_PATTERN_FILTER	0x42
> -#define USB_CDC_SET_ETHERNET_PACKET_FILTER	0x43
> -#define USB_CDC_GET_ETHERNET_STATISTIC		0x44
> +#define USB_CDC_SEND_ENCAPSULATED_COMMAND       0x00
> +#define USB_CDC_GET_ENCAPSULATED_RESPONSE       0x01
> +#define USB_CDC_REQ_SET_LINE_CODING             0x20
> +#define USB_CDC_REQ_GET_LINE_CODING             0x21
> +#define USB_CDC_REQ_SET_CONTROL_LINE_STATE      0x22
> +#define USB_CDC_REQ_SEND_BREAK                  0x23
> +#define USB_CDC_SET_ETHERNET_MULTICAST_FILTERS  0x40
> +#define USB_CDC_SET_ETHERNET_PM_PATTERN_FILTER  0x41
> +#define USB_CDC_GET_ETHERNET_PM_PATTERN_FILTER  0x42
> +#define USB_CDC_SET_ETHERNET_PACKET_FILTER      0x43
> +#define USB_CDC_GET_ETHERNET_STATISTIC          0x44
>   
> -#define USB_CDC_NETWORK_CONNECTION	0x00
> +#define USB_CDC_NETWORK_CONNECTION      0x00
>   
> -#define LOG2_STATUS_INTERVAL_MSEC	5    /* 1 << 5 == 32 msec */
> -#define STATUS_BYTECOUNT		16   /* 8 byte header + data */
> +#define LOG2_STATUS_INTERVAL_MSEC       5    /* 1 << 5 == 32 msec */
> +#define STATUS_BYTECOUNT                16   /* 8 byte header + data */
>   
> -#define ETH_FRAME_LEN			1514 /* Max. octets in frame sans FCS */
> +#define ETH_FRAME_LEN                   1514 /* Max. octets in frame sans FCS */
>   
>   static const USBDescStrings usb_net_stringtable = {
>       [STRING_MANUFACTURER]       = "QEMU",
> @@ -306,57 +306,57 @@ static const USBDesc desc_net = {
>   /*
>    * RNDIS Definitions - in theory not specific to USB.
>    */
> -#define RNDIS_MAXIMUM_FRAME_SIZE	1518
> -#define RNDIS_MAX_TOTAL_SIZE		1558
> +#define RNDIS_MAXIMUM_FRAME_SIZE        1518
> +#define RNDIS_MAX_TOTAL_SIZE            1558
>   
>   /* Remote NDIS Versions */
> -#define RNDIS_MAJOR_VERSION		1
> -#define RNDIS_MINOR_VERSION		0
> +#define RNDIS_MAJOR_VERSION             1
> +#define RNDIS_MINOR_VERSION             0
>   
>   /* Status Values */
> -#define RNDIS_STATUS_SUCCESS		0x00000000U /* Success */
> -#define RNDIS_STATUS_FAILURE		0xc0000001U /* Unspecified error */
> -#define RNDIS_STATUS_INVALID_DATA	0xc0010015U /* Invalid data */
> -#define RNDIS_STATUS_NOT_SUPPORTED	0xc00000bbU /* Unsupported request */
> -#define RNDIS_STATUS_MEDIA_CONNECT	0x4001000bU /* Device connected */
> -#define RNDIS_STATUS_MEDIA_DISCONNECT	0x4001000cU /* Device disconnected */
> +#define RNDIS_STATUS_SUCCESS            0x00000000U /* Success */
> +#define RNDIS_STATUS_FAILURE            0xc0000001U /* Unspecified error */
> +#define RNDIS_STATUS_INVALID_DATA       0xc0010015U /* Invalid data */
> +#define RNDIS_STATUS_NOT_SUPPORTED      0xc00000bbU /* Unsupported request */
> +#define RNDIS_STATUS_MEDIA_CONNECT      0x4001000bU /* Device connected */
> +#define RNDIS_STATUS_MEDIA_DISCONNECT   0x4001000cU /* Device disconnected */
>   
>   /* Message Set for Connectionless (802.3) Devices */
>   enum {
> -    RNDIS_PACKET_MSG		= 1,
> -    RNDIS_INITIALIZE_MSG	= 2,	/* Initialize device */
> -    RNDIS_HALT_MSG		= 3,
> -    RNDIS_QUERY_MSG		= 4,
> -    RNDIS_SET_MSG		= 5,
> -    RNDIS_RESET_MSG		= 6,
> -    RNDIS_INDICATE_STATUS_MSG	= 7,
> -    RNDIS_KEEPALIVE_MSG		= 8,
> +    RNDIS_PACKET_MSG            = 1,
> +    RNDIS_INITIALIZE_MSG        = 2,    /* Initialize device */
> +    RNDIS_HALT_MSG              = 3,
> +    RNDIS_QUERY_MSG             = 4,
> +    RNDIS_SET_MSG               = 5,
> +    RNDIS_RESET_MSG             = 6,
> +    RNDIS_INDICATE_STATUS_MSG   = 7,
> +    RNDIS_KEEPALIVE_MSG         = 8,
>   };
>   
>   /* Message completion */
>   enum {
> -    RNDIS_INITIALIZE_CMPLT	= 0x80000002U,
> -    RNDIS_QUERY_CMPLT		= 0x80000004U,
> -    RNDIS_SET_CMPLT		= 0x80000005U,
> -    RNDIS_RESET_CMPLT		= 0x80000006U,
> -    RNDIS_KEEPALIVE_CMPLT	= 0x80000008U,
> +    RNDIS_INITIALIZE_CMPLT      = 0x80000002U,
> +    RNDIS_QUERY_CMPLT           = 0x80000004U,
> +    RNDIS_SET_CMPLT             = 0x80000005U,
> +    RNDIS_RESET_CMPLT           = 0x80000006U,
> +    RNDIS_KEEPALIVE_CMPLT       = 0x80000008U,
>   };
>   
>   /* Device Flags */
>   enum {
> -    RNDIS_DF_CONNECTIONLESS	= 1,
> -    RNDIS_DF_CONNECTIONORIENTED	= 2,
> +    RNDIS_DF_CONNECTIONLESS     = 1,
> +    RNDIS_DF_CONNECTIONORIENTED = 2,
>   };
>   
> -#define RNDIS_MEDIUM_802_3		0x00000000U
> +#define RNDIS_MEDIUM_802_3              0x00000000U
>   
>   /* from drivers/net/sk98lin/h/skgepnmi.h */
> -#define OID_PNP_CAPABILITIES		0xfd010100
> -#define OID_PNP_SET_POWER		0xfd010101
> -#define OID_PNP_QUERY_POWER		0xfd010102
> -#define OID_PNP_ADD_WAKE_UP_PATTERN	0xfd010103
> -#define OID_PNP_REMOVE_WAKE_UP_PATTERN	0xfd010104
> -#define OID_PNP_ENABLE_WAKE_UP		0xfd010106
> +#define OID_PNP_CAPABILITIES            0xfd010100
> +#define OID_PNP_SET_POWER               0xfd010101
> +#define OID_PNP_QUERY_POWER             0xfd010102
> +#define OID_PNP_ADD_WAKE_UP_PATTERN     0xfd010103
> +#define OID_PNP_REMOVE_WAKE_UP_PATTERN  0xfd010104
> +#define OID_PNP_ENABLE_WAKE_UP          0xfd010106
>   
>   typedef uint32_t le32;
>   
> @@ -494,88 +494,88 @@ enum rndis_state
>   /* from ndis.h */
>   enum ndis_oid {
>       /* Required Object IDs (OIDs) */
> -    OID_GEN_SUPPORTED_LIST		= 0x00010101,
> -    OID_GEN_HARDWARE_STATUS		= 0x00010102,
> -    OID_GEN_MEDIA_SUPPORTED		= 0x00010103,
> -    OID_GEN_MEDIA_IN_USE		= 0x00010104,
> -    OID_GEN_MAXIMUM_LOOKAHEAD		= 0x00010105,
> -    OID_GEN_MAXIMUM_FRAME_SIZE		= 0x00010106,
> -    OID_GEN_LINK_SPEED			= 0x00010107,
> -    OID_GEN_TRANSMIT_BUFFER_SPACE	= 0x00010108,
> -    OID_GEN_RECEIVE_BUFFER_SPACE	= 0x00010109,
> -    OID_GEN_TRANSMIT_BLOCK_SIZE		= 0x0001010a,
> -    OID_GEN_RECEIVE_BLOCK_SIZE		= 0x0001010b,
> -    OID_GEN_VENDOR_ID			= 0x0001010c,
> -    OID_GEN_VENDOR_DESCRIPTION		= 0x0001010d,
> -    OID_GEN_CURRENT_PACKET_FILTER	= 0x0001010e,
> -    OID_GEN_CURRENT_LOOKAHEAD		= 0x0001010f,
> -    OID_GEN_DRIVER_VERSION		= 0x00010110,
> -    OID_GEN_MAXIMUM_TOTAL_SIZE		= 0x00010111,
> -    OID_GEN_PROTOCOL_OPTIONS		= 0x00010112,
> -    OID_GEN_MAC_OPTIONS			= 0x00010113,
> -    OID_GEN_MEDIA_CONNECT_STATUS	= 0x00010114,
> -    OID_GEN_MAXIMUM_SEND_PACKETS	= 0x00010115,
> -    OID_GEN_VENDOR_DRIVER_VERSION	= 0x00010116,
> -    OID_GEN_SUPPORTED_GUIDS		= 0x00010117,
> -    OID_GEN_NETWORK_LAYER_ADDRESSES	= 0x00010118,
> -    OID_GEN_TRANSPORT_HEADER_OFFSET	= 0x00010119,
> -    OID_GEN_MACHINE_NAME		= 0x0001021a,
> -    OID_GEN_RNDIS_CONFIG_PARAMETER	= 0x0001021b,
> -    OID_GEN_VLAN_ID			= 0x0001021c,
> +    OID_GEN_SUPPORTED_LIST              = 0x00010101,
> +    OID_GEN_HARDWARE_STATUS             = 0x00010102,
> +    OID_GEN_MEDIA_SUPPORTED             = 0x00010103,
> +    OID_GEN_MEDIA_IN_USE                = 0x00010104,
> +    OID_GEN_MAXIMUM_LOOKAHEAD           = 0x00010105,
> +    OID_GEN_MAXIMUM_FRAME_SIZE          = 0x00010106,
> +    OID_GEN_LINK_SPEED                  = 0x00010107,
> +    OID_GEN_TRANSMIT_BUFFER_SPACE       = 0x00010108,
> +    OID_GEN_RECEIVE_BUFFER_SPACE        = 0x00010109,
> +    OID_GEN_TRANSMIT_BLOCK_SIZE         = 0x0001010a,
> +    OID_GEN_RECEIVE_BLOCK_SIZE          = 0x0001010b,
> +    OID_GEN_VENDOR_ID                   = 0x0001010c,
> +    OID_GEN_VENDOR_DESCRIPTION          = 0x0001010d,
> +    OID_GEN_CURRENT_PACKET_FILTER       = 0x0001010e,
> +    OID_GEN_CURRENT_LOOKAHEAD           = 0x0001010f,
> +    OID_GEN_DRIVER_VERSION              = 0x00010110,
> +    OID_GEN_MAXIMUM_TOTAL_SIZE          = 0x00010111,
> +    OID_GEN_PROTOCOL_OPTIONS            = 0x00010112,
> +    OID_GEN_MAC_OPTIONS                 = 0x00010113,
> +    OID_GEN_MEDIA_CONNECT_STATUS        = 0x00010114,
> +    OID_GEN_MAXIMUM_SEND_PACKETS        = 0x00010115,
> +    OID_GEN_VENDOR_DRIVER_VERSION       = 0x00010116,
> +    OID_GEN_SUPPORTED_GUIDS             = 0x00010117,
> +    OID_GEN_NETWORK_LAYER_ADDRESSES     = 0x00010118,
> +    OID_GEN_TRANSPORT_HEADER_OFFSET     = 0x00010119,
> +    OID_GEN_MACHINE_NAME                = 0x0001021a,
> +    OID_GEN_RNDIS_CONFIG_PARAMETER      = 0x0001021b,
> +    OID_GEN_VLAN_ID                     = 0x0001021c,
>   
>       /* Optional OIDs */
> -    OID_GEN_MEDIA_CAPABILITIES		= 0x00010201,
> -    OID_GEN_PHYSICAL_MEDIUM		= 0x00010202,
> +    OID_GEN_MEDIA_CAPABILITIES          = 0x00010201,
> +    OID_GEN_PHYSICAL_MEDIUM             = 0x00010202,
>   
>       /* Required statistics OIDs */
> -    OID_GEN_XMIT_OK			= 0x00020101,
> -    OID_GEN_RCV_OK			= 0x00020102,
> -    OID_GEN_XMIT_ERROR			= 0x00020103,
> -    OID_GEN_RCV_ERROR			= 0x00020104,
> -    OID_GEN_RCV_NO_BUFFER		= 0x00020105,
> +    OID_GEN_XMIT_OK                     = 0x00020101,
> +    OID_GEN_RCV_OK                      = 0x00020102,
> +    OID_GEN_XMIT_ERROR                  = 0x00020103,
> +    OID_GEN_RCV_ERROR                   = 0x00020104,
> +    OID_GEN_RCV_NO_BUFFER               = 0x00020105,
>   
>       /* Optional statistics OIDs */
> -    OID_GEN_DIRECTED_BYTES_XMIT		= 0x00020201,
> -    OID_GEN_DIRECTED_FRAMES_XMIT	= 0x00020202,
> -    OID_GEN_MULTICAST_BYTES_XMIT	= 0x00020203,
> -    OID_GEN_MULTICAST_FRAMES_XMIT	= 0x00020204,
> -    OID_GEN_BROADCAST_BYTES_XMIT	= 0x00020205,
> -    OID_GEN_BROADCAST_FRAMES_XMIT	= 0x00020206,
> -    OID_GEN_DIRECTED_BYTES_RCV		= 0x00020207,
> -    OID_GEN_DIRECTED_FRAMES_RCV		= 0x00020208,
> -    OID_GEN_MULTICAST_BYTES_RCV		= 0x00020209,
> -    OID_GEN_MULTICAST_FRAMES_RCV	= 0x0002020a,
> -    OID_GEN_BROADCAST_BYTES_RCV		= 0x0002020b,
> -    OID_GEN_BROADCAST_FRAMES_RCV	= 0x0002020c,
> -    OID_GEN_RCV_CRC_ERROR		= 0x0002020d,
> -    OID_GEN_TRANSMIT_QUEUE_LENGTH	= 0x0002020e,
> -    OID_GEN_GET_TIME_CAPS		= 0x0002020f,
> -    OID_GEN_GET_NETCARD_TIME		= 0x00020210,
> -    OID_GEN_NETCARD_LOAD		= 0x00020211,
> -    OID_GEN_DEVICE_PROFILE		= 0x00020212,
> -    OID_GEN_INIT_TIME_MS		= 0x00020213,
> -    OID_GEN_RESET_COUNTS		= 0x00020214,
> -    OID_GEN_MEDIA_SENSE_COUNTS		= 0x00020215,
> -    OID_GEN_FRIENDLY_NAME		= 0x00020216,
> -    OID_GEN_MINIPORT_INFO		= 0x00020217,
> -    OID_GEN_RESET_VERIFY_PARAMETERS	= 0x00020218,
> +    OID_GEN_DIRECTED_BYTES_XMIT         = 0x00020201,
> +    OID_GEN_DIRECTED_FRAMES_XMIT        = 0x00020202,
> +    OID_GEN_MULTICAST_BYTES_XMIT        = 0x00020203,
> +    OID_GEN_MULTICAST_FRAMES_XMIT       = 0x00020204,
> +    OID_GEN_BROADCAST_BYTES_XMIT        = 0x00020205,
> +    OID_GEN_BROADCAST_FRAMES_XMIT       = 0x00020206,
> +    OID_GEN_DIRECTED_BYTES_RCV          = 0x00020207,
> +    OID_GEN_DIRECTED_FRAMES_RCV         = 0x00020208,
> +    OID_GEN_MULTICAST_BYTES_RCV         = 0x00020209,
> +    OID_GEN_MULTICAST_FRAMES_RCV        = 0x0002020a,
> +    OID_GEN_BROADCAST_BYTES_RCV         = 0x0002020b,
> +    OID_GEN_BROADCAST_FRAMES_RCV        = 0x0002020c,
> +    OID_GEN_RCV_CRC_ERROR               = 0x0002020d,
> +    OID_GEN_TRANSMIT_QUEUE_LENGTH       = 0x0002020e,
> +    OID_GEN_GET_TIME_CAPS               = 0x0002020f,
> +    OID_GEN_GET_NETCARD_TIME            = 0x00020210,
> +    OID_GEN_NETCARD_LOAD                = 0x00020211,
> +    OID_GEN_DEVICE_PROFILE              = 0x00020212,
> +    OID_GEN_INIT_TIME_MS                = 0x00020213,
> +    OID_GEN_RESET_COUNTS                = 0x00020214,
> +    OID_GEN_MEDIA_SENSE_COUNTS          = 0x00020215,
> +    OID_GEN_FRIENDLY_NAME               = 0x00020216,
> +    OID_GEN_MINIPORT_INFO               = 0x00020217,
> +    OID_GEN_RESET_VERIFY_PARAMETERS     = 0x00020218,
>   
>       /* IEEE 802.3 (Ethernet) OIDs */
> -    OID_802_3_PERMANENT_ADDRESS		= 0x01010101,
> -    OID_802_3_CURRENT_ADDRESS		= 0x01010102,
> -    OID_802_3_MULTICAST_LIST		= 0x01010103,
> -    OID_802_3_MAXIMUM_LIST_SIZE		= 0x01010104,
> -    OID_802_3_MAC_OPTIONS		= 0x01010105,
> -    OID_802_3_RCV_ERROR_ALIGNMENT	= 0x01020101,
> -    OID_802_3_XMIT_ONE_COLLISION	= 0x01020102,
> -    OID_802_3_XMIT_MORE_COLLISIONS	= 0x01020103,
> -    OID_802_3_XMIT_DEFERRED		= 0x01020201,
> -    OID_802_3_XMIT_MAX_COLLISIONS	= 0x01020202,
> -    OID_802_3_RCV_OVERRUN		= 0x01020203,
> -    OID_802_3_XMIT_UNDERRUN		= 0x01020204,
> -    OID_802_3_XMIT_HEARTBEAT_FAILURE	= 0x01020205,
> -    OID_802_3_XMIT_TIMES_CRS_LOST	= 0x01020206,
> -    OID_802_3_XMIT_LATE_COLLISIONS	= 0x01020207,
> +    OID_802_3_PERMANENT_ADDRESS         = 0x01010101,
> +    OID_802_3_CURRENT_ADDRESS           = 0x01010102,
> +    OID_802_3_MULTICAST_LIST            = 0x01010103,
> +    OID_802_3_MAXIMUM_LIST_SIZE         = 0x01010104,
> +    OID_802_3_MAC_OPTIONS               = 0x01010105,
> +    OID_802_3_RCV_ERROR_ALIGNMENT       = 0x01020101,
> +    OID_802_3_XMIT_ONE_COLLISION        = 0x01020102,
> +    OID_802_3_XMIT_MORE_COLLISIONS      = 0x01020103,
> +    OID_802_3_XMIT_DEFERRED             = 0x01020201,
> +    OID_802_3_XMIT_MAX_COLLISIONS       = 0x01020202,
> +    OID_802_3_RCV_OVERRUN               = 0x01020203,
> +    OID_802_3_XMIT_UNDERRUN             = 0x01020204,
> +    OID_802_3_XMIT_HEARTBEAT_FAILURE    = 0x01020205,
> +    OID_802_3_XMIT_TIMES_CRS_LOST       = 0x01020206,
> +    OID_802_3_XMIT_LATE_COLLISIONS      = 0x01020207,
>   };
>   
>   static const uint32_t oid_supported_list[] =
> @@ -618,13 +618,13 @@ static const uint32_t oid_supported_list[] =
>       OID_802_3_XMIT_MORE_COLLISIONS,
>   };
>   
> -#define NDIS_MAC_OPTION_COPY_LOOKAHEAD_DATA	(1 << 0)
> -#define NDIS_MAC_OPTION_RECEIVE_SERIALIZED	(1 << 1)
> -#define NDIS_MAC_OPTION_TRANSFERS_NOT_PEND	(1 << 2)
> -#define NDIS_MAC_OPTION_NO_LOOPBACK		(1 << 3)
> -#define NDIS_MAC_OPTION_FULL_DUPLEX		(1 << 4)
> -#define NDIS_MAC_OPTION_EOTX_INDICATION		(1 << 5)
> -#define NDIS_MAC_OPTION_8021P_PRIORITY		(1 << 6)
> +#define NDIS_MAC_OPTION_COPY_LOOKAHEAD_DATA     (1 << 0)
> +#define NDIS_MAC_OPTION_RECEIVE_SERIALIZED      (1 << 1)
> +#define NDIS_MAC_OPTION_TRANSFERS_NOT_PEND      (1 << 2)
> +#define NDIS_MAC_OPTION_NO_LOOPBACK             (1 << 3)
> +#define NDIS_MAC_OPTION_FULL_DUPLEX             (1 << 4)
> +#define NDIS_MAC_OPTION_EOTX_INDICATION         (1 << 5)
> +#define NDIS_MAC_OPTION_8021P_PRIORITY          (1 << 6)
>   
>   struct rndis_response {
>       QTAILQ_ENTRY(rndis_response) entries;
> @@ -1375,12 +1375,12 @@ static void usb_net_realize(USBDevice *dev, Error **errp)
>       s->rndis_state = RNDIS_UNINITIALIZED;
>       QTAILQ_INIT(&s->rndis_resp);
>   
> -    s->medium = 0;	/* NDIS_MEDIUM_802_3 */
> +    s->medium = 0;      /* NDIS_MEDIUM_802_3 */
>       s->speed = 1000000; /* 100MBps, in 100Bps units */
> -    s->media_state = 0;	/* NDIS_MEDIA_STATE_CONNECTED */;
> +    s->media_state = 0; /* NDIS_MEDIA_STATE_CONNECTED */;
>       s->filter = 0;
>       s->vendorid = 0x1234;
> -    s->connection = 1;	/* Connected */
> +    s->connection = 1;  /* Connected */
>       s->intr = usb_ep_get(dev, USB_TOKEN_IN, 1);
>       s->bulk_in = usb_ep_get(dev, USB_TOKEN_IN, 2);
>   
> diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
> index 8323650c6a..7177c17f03 100644
> --- a/hw/usb/dev-wacom.c
> +++ b/hw/usb/dev-wacom.c
> @@ -36,8 +36,8 @@
>   #include "qom/object.h"
>   
>   /* Interface requests */
> -#define WACOM_GET_REPORT	0x2101
> -#define WACOM_SET_REPORT	0x2109
> +#define WACOM_GET_REPORT    0x2101
> +#define WACOM_SET_REPORT    0x2109
>   
>   struct USBWacomState {
>       USBDevice dev;
> diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
> index 85f5ff5bd4..6929b026b1 100644
> --- a/hw/usb/hcd-musb.c
> +++ b/hw/usb/hcd-musb.c
> @@ -28,227 +28,227 @@
>   #include "hw/hw.h"
>   
>   /* Common USB registers */
> -#define MUSB_HDRC_FADDR		0x00	/* 8-bit */
> -#define MUSB_HDRC_POWER		0x01	/* 8-bit */
> -
> -#define MUSB_HDRC_INTRTX	0x02	/* 16-bit */
> -#define MUSB_HDRC_INTRRX	0x04
> -#define MUSB_HDRC_INTRTXE	0x06
> -#define MUSB_HDRC_INTRRXE	0x08
> -#define MUSB_HDRC_INTRUSB	0x0a	/* 8 bit */
> -#define MUSB_HDRC_INTRUSBE	0x0b	/* 8 bit */
> -#define MUSB_HDRC_FRAME		0x0c	/* 16-bit */
> -#define MUSB_HDRC_INDEX		0x0e	/* 8 bit */
> -#define MUSB_HDRC_TESTMODE	0x0f	/* 8 bit */
> +#define MUSB_HDRC_FADDR         0x00    /* 8-bit */
> +#define MUSB_HDRC_POWER         0x01    /* 8-bit */
> +
> +#define MUSB_HDRC_INTRTX        0x02    /* 16-bit */
> +#define MUSB_HDRC_INTRRX        0x04
> +#define MUSB_HDRC_INTRTXE       0x06

Sorry for not noticing it earlier, and the problem is pre-existing and not 
related to your patches, but in case you respinning again, my git is 
complaining here about the spaces at the end of the line:

.git/rebase-apply/patch:524: trailing whitespace.
#define MUSB_HDRC_INTRTXE       0x06

(maybe this could also be fixed by the maintainer when picking up the patch)

> +#define MUSB_HDRC_INTRRXE       0x08

dito

> +#define MUSB_HDRC_INTRUSB       0x0a    /* 8 bit */
> +#define MUSB_HDRC_INTRUSBE      0x0b    /* 8 bit */
> +#define MUSB_HDRC_FRAME         0x0c    /* 16-bit */
> +#define MUSB_HDRC_INDEX         0x0e    /* 8 bit */
> +#define MUSB_HDRC_TESTMODE      0x0f    /* 8 bit */
[...]
>   /*
>    * MUSBHDRC Register bit masks
>    */
>   
>   /* POWER */
> -#define MGC_M_POWER_ISOUPDATE		0x80

Same here

> -#define	MGC_M_POWER_SOFTCONN		0x40
> -#define	MGC_M_POWER_HSENAB		0x20
> -#define	MGC_M_POWER_HSMODE		0x10
> -#define MGC_M_POWER_RESET		0x08
> -#define MGC_M_POWER_RESUME		0x04
> -#define MGC_M_POWER_SUSPENDM		0x02
> -#define MGC_M_POWER_ENSUSPEND		0x01
> +#define MGC_M_POWER_ISOUPDATE           0x80
> +#define MGC_M_POWER_SOFTCONN            0x40
> +#define MGC_M_POWER_HSENAB              0x20
> +#define MGC_M_POWER_HSMODE              0x10
> +#define MGC_M_POWER_RESET               0x08
> +#define MGC_M_POWER_RESUME              0x04
> +#define MGC_M_POWER_SUSPENDM            0x02
> +#define MGC_M_POWER_ENSUSPEND           0x01
>   
>   /* INTRUSB */
> -#define MGC_M_INTR_SUSPEND		0x01
> -#define MGC_M_INTR_RESUME		0x02
> -#define MGC_M_INTR_RESET		0x04
> -#define MGC_M_INTR_BABBLE		0x04
> -#define MGC_M_INTR_SOF			0x08
> -#define MGC_M_INTR_CONNECT		0x10
> -#define MGC_M_INTR_DISCONNECT		0x20
> -#define MGC_M_INTR_SESSREQ		0x40
> -#define MGC_M_INTR_VBUSERROR		0x80	/* FOR SESSION END */
> -#define MGC_M_INTR_EP0			0x01	/* FOR EP0 INTERRUPT */
> +#define MGC_M_INTR_SUSPEND              0x01
> +#define MGC_M_INTR_RESUME               0x02
> +#define MGC_M_INTR_RESET                0x04
> +#define MGC_M_INTR_BABBLE               0x04
> +#define MGC_M_INTR_SOF                  0x08

... and here ...

> +#define MGC_M_INTR_CONNECT              0x10
> +#define MGC_M_INTR_DISCONNECT           0x20
> +#define MGC_M_INTR_SESSREQ              0x40
> +#define MGC_M_INTR_VBUSERROR            0x80    /* FOR SESSION END */
> +#define MGC_M_INTR_EP0                  0x01    /* FOR EP0 INTERRUPT */
>   
>   /* DEVCTL */
> -#define MGC_M_DEVCTL_BDEVICE		0x80
> -#define MGC_M_DEVCTL_FSDEV		0x40
> -#define MGC_M_DEVCTL_LSDEV		0x20
> -#define MGC_M_DEVCTL_VBUS		0x18
> -#define MGC_S_DEVCTL_VBUS		3
> -#define MGC_M_DEVCTL_HM			0x04
> -#define MGC_M_DEVCTL_HR			0x02
> -#define MGC_M_DEVCTL_SESSION		0x01
> +#define MGC_M_DEVCTL_BDEVICE            0x80

... and here, too.

  Thomas


